# Doodiary

**文字を入力しない、落書き感覚のメンタルヘルス日記アプリ**

スライダー・色・天気メタファー・ボディマップ・スケッチ・写真で感情を記録し、AIが心理的インサイトを生成する。

## 技術スタック

| レイヤー | 技術 |
|---|---|
| フロントエンド | Flutter（iOS / Android） |
| 状態管理 | Riverpod + riverpod_annotation |
| ローカルDB | Drift（SQLite） |
| バックエンド | Supabase（PostgreSQL + Auth + Edge Functions） |
| AI分析 | Claude API（Haiku 4.5） |
| 課金 | RevenueCat |
| ルーティング | go_router |
| モデル | Freezed |
| バージョン管理 | fvm（Flutter Version Manager） |

## セットアップ

```bash
# fvm でFlutterバージョンを合わせる
fvm install
fvm use

# 依存パッケージ取得
fvm flutter pub get

# コード生成
dart run build_runner build --delete-conflicting-outputs
```

### 環境変数

Supabase の URL と Anon Key は `--dart-define` で注入する。シークレットはリポジトリに含めない。

```bash
fvm flutter run \
  --dart-define=SUPABASE_URL=https://xxxx.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=your-anon-key
```

## ディレクトリ構成

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

## 開発フロー

- `main` への直接コミット禁止
- 機能・画面ごとにブランチを切る（例: `feature/record-screen`）
- PRを作成してシミュレーター or 実機で確認後にマージ
- タスクは [GitHub Issues](https://github.com/urayusuke/Doodiary/issues) で管理

## コード生成（監視モード）

```bash
dart run build_runner watch --delete-conflicting-outputs
```
