---
name: doodiary-dev
description: Doodiary（文字入力なしのメンタルヘルス日記アプリ）の実装スキル。feature追加・Supabase repository・Riverpod state・Isarキャッシュ・7軸レーダーチャート・非言語入力UI（スライダー/カラー/天気/ボディマップ/スケッチ）・Claude APIインサイト生成・RevenueCat課金を実装するときに使う。Doodiaryのコードを書く・修正するあらゆる場面で参照する。
---

# Doodiary 実装スキル

このスキルはDoodiary固有の実装パターンを提供する。
**汎用の知識は以下のグローバルスキルに任せ、ここでは重複させない：**

- コーディング哲学 → `yusuke-coding-style`
- Flutter全般の専門知識 → `flutter-pro`
- コードレビュー → `flutter-dart-code-review`
- 心理分析ロジック・フレームワーク → `psychology-pro`
- Claude API実装 → `claude-api`

要件・アーキテクチャ全体は `CLAUDE.md` を参照。このスキルは「どう書くか」の実装レシピに特化する。

---

## 1. feature の足場（必ずこの順で作る）

新しいfeatureを足すときは `lib/features/[name]/` 配下に4ディレクトリを作り、
**models → repository → state → screens** の順で実装する（依存方向と同じ）。

```
features/[name]/
├── models/        # Freezed。データ構造のみ。Supabase依存を持ち込まない
├── repository/    # Supabase CRUD のみ。状態を持たない
├── state/         # [name]_state.dart 1ファイルに State + Notifier
└── screens/       # ConsumerWidget。ref.watch して描画するだけ
```

依存の向き: `screens → state → repository → models`
逆流は禁止（repositoryがstateを知る、modelsがSupabaseを知る、は不可）。

---

## 2. Repository パターン

Supabase操作だけを書く。DBの行 ↔ モデルの変換もここで行う（モデルには書かない）。

```dart
class RecordRepository {
  RecordRepository(this._client);

  final SupabaseClient _client;

  // 外部I/Oなので、失敗しうる箇所だけ try-catch する
  Future<Record?> create(Record record) async {
    final row = _toRow(record);

    final response = await _client
        .from(SupabaseTable.records)
        .insert(row)
        .select()
        .maybeSingle();

    if (response == null) return null;

    return _fromRow(response);
  }

  // 変換はrepositoryの責務。モデルをSupabase非依存に保つため
  Record _fromRow(Map<String, dynamic> row) {
    return Record(
      id: row['id'] as String,
      energy: row['energy'] as int,
      // ...
    );
  }

  Map<String, dynamic> _toRow(Record record) {
    return {
      'energy': record.energy,
      // ...
    };
  }
}
```

- テーブル名・カラム名は `common/constants/` に定数化（ハードコード禁止）
- `try-catch` はネットワーク・書き込みなど例外が出うる箇所のみ。通常の有無判定は `null` チェックで行う

---

## 3. State + Notifier（1ファイル）

`state/[name]_state.dart` に State と Notifier をまとめる。更新は必ず `copyWith`。

```dart
@freezed
class RecordState with _$RecordState {
  const factory RecordState({
    @Default(false) bool isSaving,
    Record? todayRecord,
    Object? error,
  }) = _RecordState;
}

@riverpod
class RecordNotifier extends _$RecordNotifier {
  @override
  RecordState build() {
    return const RecordState();
  }

  Future<void> save(Record record) async {
    state = state.copyWith(isSaving: true);

    final saved = await ref.read(recordRepositoryProvider).create(record);

    // 失敗は握りつぶさず状態に乗せ、screen側で出し分ける
    if (saved == null) {
      state = state.copyWith(isSaving: false, error: 'save_failed');
      return;
    }

    state = state.copyWith(isSaving: false, todayRecord: saved);
  }
}
```

---

## 4. 非言語入力UI（このアプリの核）

文字入力は一切なし。入力は全てジェスチャー・視覚操作。
凝った見た目はCustomPainter、単純なものは標準ウィジェットで足りる。

| UI | 実装方針 |
|---|---|
| 感情スライダー（必須） | CustomPainter + GestureDetector。値変化時に `HapticFeedback.selectionClick()` |
| カラーパレット | 定数の色リストをGridで。選択状態をstateに持つ |
| 天気メタファー | enum（sunny/cloudy/rainy…）をアイコンタップで選択 |
| ボディマップ | 人体SVG/PNG上のタップ座標 → 部位enumに変換 |
| スケッチ | CustomPaint + パス記録。base64で保存 |
| 写真 | image_picker。送信はオプション（同意制） |

- 入力データは全て数値・enum・座標・画像。**日本語テキストは存在しない**
- 触覚フィードバックを各操作に入れて「気持ちよさ」を作る（flutter_animate併用）

---

## 5. 感情の7軸（レーダーチャート）

分析結果は固定の7軸。順序・キーを `common/constants/` に定数化して全画面で共有する。

```
energy        エネルギー
stability     安定性
sociability   社交性
selfEsteem    自己肯定感
stressLoad    ストレス負荷
complexity    感情の複雑性
positivity    ポジティブ度
```

- レーダー描画はCustomPainter。7頂点を等角配置（2π/7）
- 即時フィードバック用のスコアはローカル計算（オフライン・無料）
- 深いインサイト文だけClaudeに投げる（次項）

---

## 6. Claude API インサイト生成

**毎回の入力では呼ばない。** 1日の終わりに当日分をまとめて1リクエスト。
呼び出しはSupabase Edge Functions経由（APIキーをクライアントに露出させない）。

```
[Flutter] 当日の構造化データ（数値・enum・座標・任意で画像base64）
   ↓
[Supabase Edge Function] system promptに心理フレームワーク（CBT/ACT）を埋め込む
   ↓
[Claude API] model: claude-haiku-4-5
   ↓ JSON: { axes: {...7軸スコア}, insight: "日本語テキスト" }
[Isar / Supabase] に保存
```

- 心理分析プロンプトの設計は `psychology-pro` を参照
- 実装（SDK・ストリーミング等）は `claude-api` を参照
- 送信データは匿名化（userIdを送らない、個人特定情報を除く）

---

## 7. Isar ローカルキャッシュ

オフラインでも記録・閲覧できるよう、Isarをローカルの真実とする。
Supabaseは同期先。書き込みは「Isar即時 → Supabaseへ非同期反映」。

- Isarのcollectionと `models/` のFreezedモデルは分ける（責務分離）
- 変換はrepositoryで行う

---

## 8. 課金ゲート（RevenueCat）

```
無料: 記録無制限・当日グラフ・過去7日
Pro : 過去無制限・週次月次インサイト・パターン検出
```

- Pro判定は1箇所（`settings` feature の state）に集約し、各画面はそれをwatchする
- 課金導線は「8日前のデータを開こうとした瞬間」に出す
- 実装は `purchases_flutter`。課金状態はSupabaseにも保存して整合を取る

---

## チェックリスト（実装後に確認）

- [ ] screensにロジックを書いていない（ref.watchして描画のみ）
- [ ] repositoryに状態を持たせていない
- [ ] modelsにSupabase依存がない
- [ ] 文字列・数値・色をハードコードしていない（constants参照）
- [ ] `print()` を使っていない（`debugPrint()`）
- [ ] 相対インポートを使っていない（`package:doodiary/...`）
- [ ] アロー関数で副作用を書いていない（`{ }` ブロック）
- [ ] try-catchは例外が出うる箇所だけ
- [ ] copyWithで状態更新している
