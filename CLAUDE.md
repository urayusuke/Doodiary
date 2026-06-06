# Doodiary — CLAUDE.md

## プロジェクト概要

**文字を入力しない、落書き感覚のメンタルヘルス日記アプリ**

- スライダー・色・天気メタファー・ボディマップ・スケッチ・写真で感情を記録
- AIが心理的インサイトを生成（表面の感情ではなく、その奥にあるものを分析）
- 非言語カウンセリング体験をアプリ上で実現
- アプリ名: **Doodiary**（Doodle + Diary）
- Bundle ID: `com.comoreve.doodiary`

---

## 技術スタック

| レイヤー | 技術 |
|---|---|
| フロントエンド | Flutter（iOS / Android） |
| 状態管理 | Riverpod + riverpod_annotation |
| ローカルDB | Isar |
| バックエンド | Supabase（PostgreSQL + Auth + Edge Functions） |
| AI分析 | Claude API（Haiku 4.5） |
| 課金 | RevenueCat（アプリ内課金） |
| ルーティング | go_router |
| モデル | Freezed |

---

## アーキテクチャ（厳守）

### ディレクトリ構成

```
lib/
├── app/
│   ├── routes/           # go_router のみ
│   └── services/         # Supabase初期化・グローバルProvider
├── features/
│   └── [feature_name]/
│       ├── models/       # Freezedモデルのみ
│       ├── repository/   # Supabase操作のみ
│       ├── state/        # State + Notifier（1ファイル）
│       └── screens/      # ConsumerWidget（UIのみ）
├── common/
│   ├── constants/        # 色・文言・サイズ・設定値
│   └── widgets/          # 共有ウィジェット
└── main.dart
```

### 各レイヤーの責務

| レイヤー | 責務 | 書いてはいけないもの |
|---|---|---|
| `models/` | Freezedデータ構造のみ | ビジネスロジック・Supabase依存 |
| `repository/` | Supabase CRUD | 状態管理・UI |
| `state/` | StateクラスとNotifier（1ファイル） | Supabase直接操作・UI |
| `screens/` | UIの描画のみ | ロジック・Supabase操作 |

---

## 禁止事項

- `bindings/` `utils/` `helpers/` `extensions/` など指定外のディレクトリは作成しない
- `screens/` にロジックを書かない（`ref.watch` して表示するだけ）
- `repository/` に状態管理を書かない（Supabase操作のみ）
- 文字列・数値・色のハードコード禁止（`common/constants/` を使う）
- `print()` 禁止（`debugPrint()` を使う）
- 相対インポート禁止（`package:doodiary/...` で統一）
- アロー関数（`=>`）は使わない。`onPressed` 等も `{ }` ブロックで書く

---

## コーディングスタイル

- 条件分岐は `if` 優先。三項演算子は1行で済む軽微な場合のみ
- 早期リターンでネストを浅く保つ
- メソッドチェーンは繋げすぎない → 途中で変数に切り出す
- 末尾カンマを積極的に使い、改行・整形を徹底
- ウィジェットは分割しすぎない（シート・カードなど意味のある単位では分割OK）
- メソッドを分けすぎない
- コメントは「なぜそうしているか」を書く（何をしているかは書かない）
- 意味のあるまとまりで書く

### Freezed 規約

- `fromJson` / DBマッピングはモデルに書かない → Repositoryで変換
- 状態更新は必ず `copyWith`
- State と Notifier は1ファイル（`xxx_state.dart`）

### コード生成

```bash
dart run build_runner watch --delete-conflicting-outputs
```

---

## 要件

### 入力UI（文字入力なし）

| UI | 内容 |
|---|---|
| 感情スライダー | どんより〜すっきり（必須入力） |
| カラーパレット | 今の気分を色で選ぶ |
| 天気メタファー | 晴れ・曇り・雨など |
| ボディマップ | 体のどこに感覚があるか |
| スケッチ | 自由描画 |
| 写真 | カメラ・ライブラリから |

### 分析・出力

- レーダーチャート（7軸：エネルギー・安定性・社交性・自己肯定感・ストレス・感情複雑性・ポジティブ度）
- 1日の感情バランス図
- 今日の気づき（Claudeが日本語で生成）
- カレンダー（色で感情を可視化）
- 週次・月次パターン検出（Pro）

### マネタイズ

```
無料
├── 記録：無制限
├── 当日のグラフ・インサイト
└── 過去7日分

Pro（¥980/月 or ¥6,000/年）
├── 過去データ無制限
├── 週次・月次インサイト
├── パターン検出
└── 将来：グループ機能
```

**課金導線：** 匿名ログイン → 使い続ける → 8日目に過去データ閲覧で課金誘導

### 認証フロー

```
初回起動 → 匿名ログイン（自動）→ 普通に使える
↓ 7日経過 or Pro誘導タイミング
「データを引き継ぐにはアカウント登録が必要です」
→ Apple / Google でログイン → 匿名データ引き継ぎ
```

---

## 画面構成

| 画面 | 説明 |
|---|---|
| Journal（ホーム） | DAY STREAK・記録開始ボタン |
| 気分入力 | スライダーで感情記録 |
| 記録完了 | お疲れ様でした + 今日のメッセージ |
| Insights | 感情バランス図 + 今日の気づき + タイムライン |
| Calendar | 色カレンダー + 週次傾向 |
| 設定 | アカウント・通知・課金管理 |
| Pro誘導モーダル | 7日間無料体験 |
| 料金プラン選択 | ¥980/月 or ¥6,000/年 |

---

## 実装フェーズ

```
Phase 1（MVP）
├── ディレクトリ構成・依存パッケージ
├── 気分入力UI（スライダー）
├── Supabase セットアップ・Auth
├── Isar ローカル保存
└── レーダーチャート表示

Phase 2
├── Claude API 繋ぎ込み
├── インサイト生成
└── Calendar画面

Phase 3
├── RevenueCat 課金実装
├── Pro機能ゲート
└── ストア申請
```

---

*Doodiary CLAUDE.md — 2026年6月*
