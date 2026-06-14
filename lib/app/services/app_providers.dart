import 'package:doodiary/app/services/app_database.dart';
import 'package:doodiary/features/record/repository/record_repository.dart';
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

/// RecordRepository のシングルトンを提供する。
/// appDatabase に依存するため、DB 接続と同じライフサイクルで保持する。
@Riverpod(keepAlive: true)
RecordRepository recordRepository(Ref ref) {
  return RecordRepository(ref.watch(appDatabaseProvider));
}
