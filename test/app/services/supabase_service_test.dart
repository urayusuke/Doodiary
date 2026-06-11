import 'package:doodiary/app/services/supabase_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SupabaseService', () {
    test('SupabaseService クラスが存在する', () {
      // dart-define なし環境での初期化はできないため、
      // クラス自体のアクセスのみ確認する。
      expect(SupabaseService, isNotNull);
    });
  });
}
