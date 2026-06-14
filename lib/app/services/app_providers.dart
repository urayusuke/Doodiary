import 'package:doodiary/app/services/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_providers.g.dart';

/// AppDatabase のシングルトンを提供する。
/// keepAlive: true でアプリ終了まで DB 接続を維持する。
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}
