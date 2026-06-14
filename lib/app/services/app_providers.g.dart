// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// AppDatabase のシングルトンを提供する。
/// keepAlive: true でアプリ終了まで DB 接続を維持する。

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

/// AppDatabase のシングルトンを提供する。
/// keepAlive: true でアプリ終了まで DB 接続を維持する。

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// AppDatabase のシングルトンを提供する。
  /// keepAlive: true でアプリ終了まで DB 接続を維持する。
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'59cce38d45eeaba199eddd097d8e149d66f9f3e1';

/// RecordRepository のシングルトンを提供する。
/// appDatabase に依存するため、DB 接続と同じライフサイクルで保持する。

@ProviderFor(recordRepository)
final recordRepositoryProvider = RecordRepositoryProvider._();

/// RecordRepository のシングルトンを提供する。
/// appDatabase に依存するため、DB 接続と同じライフサイクルで保持する。

final class RecordRepositoryProvider
    extends
        $FunctionalProvider<
          RecordRepository,
          RecordRepository,
          RecordRepository
        >
    with $Provider<RecordRepository> {
  /// RecordRepository のシングルトンを提供する。
  /// appDatabase に依存するため、DB 接続と同じライフサイクルで保持する。
  RecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordRepositoryHash();

  @$internal
  @override
  $ProviderElement<RecordRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecordRepository create(Ref ref) {
    return recordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordRepository>(value),
    );
  }
}

String _$recordRepositoryHash() => r'6cea4e7e5b9f58483a30e20712cf9740bad495e1';
