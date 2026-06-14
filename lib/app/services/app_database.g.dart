// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DiaryRecordsTableTable extends DiaryRecordsTable
    with TableInfo<$DiaryRecordsTableTable, DiaryRecordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryRecordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rowIdMeta = const VerificationMeta('rowId');
  @override
  late final GeneratedColumn<int> rowId = GeneratedColumn<int>(
    'row_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodSliderMeta = const VerificationMeta(
    'moodSlider',
  );
  @override
  late final GeneratedColumn<double> moodSlider = GeneratedColumn<double>(
    'mood_slider',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodColorMeta = const VerificationMeta(
    'moodColor',
  );
  @override
  late final GeneratedColumn<int> moodColor = GeneratedColumn<int>(
    'mood_color',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weatherMeta = const VerificationMeta(
    'weather',
  );
  @override
  late final GeneratedColumn<String> weather = GeneratedColumn<String>(
    'weather',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyPartsMeta = const VerificationMeta(
    'bodyParts',
  );
  @override
  late final GeneratedColumn<String> bodyParts = GeneratedColumn<String>(
    'body_parts',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _sketchPathMeta = const VerificationMeta(
    'sketchPath',
  );
  @override
  late final GeneratedColumn<String> sketchPath = GeneratedColumn<String>(
    'sketch_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    rowId,
    id,
    recordedAt,
    moodSlider,
    moodColor,
    weather,
    bodyParts,
    sketchPath,
    photoPath,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diary_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiaryRecordsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('row_id')) {
      context.handle(
        _rowIdMeta,
        rowId.isAcceptableOrUnknown(data['row_id']!, _rowIdMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('mood_slider')) {
      context.handle(
        _moodSliderMeta,
        moodSlider.isAcceptableOrUnknown(data['mood_slider']!, _moodSliderMeta),
      );
    } else if (isInserting) {
      context.missing(_moodSliderMeta);
    }
    if (data.containsKey('mood_color')) {
      context.handle(
        _moodColorMeta,
        moodColor.isAcceptableOrUnknown(data['mood_color']!, _moodColorMeta),
      );
    }
    if (data.containsKey('weather')) {
      context.handle(
        _weatherMeta,
        weather.isAcceptableOrUnknown(data['weather']!, _weatherMeta),
      );
    }
    if (data.containsKey('body_parts')) {
      context.handle(
        _bodyPartsMeta,
        bodyParts.isAcceptableOrUnknown(data['body_parts']!, _bodyPartsMeta),
      );
    }
    if (data.containsKey('sketch_path')) {
      context.handle(
        _sketchPathMeta,
        sketchPath.isAcceptableOrUnknown(data['sketch_path']!, _sketchPathMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rowId};
  @override
  DiaryRecordsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiaryRecordsTableData(
      rowId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}row_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      moodSlider: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mood_slider'],
      )!,
      moodColor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood_color'],
      ),
      weather: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weather'],
      ),
      bodyParts: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_parts'],
      )!,
      sketchPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sketch_path'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $DiaryRecordsTableTable createAlias(String alias) {
    return $DiaryRecordsTableTable(attachedDatabase, alias);
  }
}

class DiaryRecordsTableData extends DataClass
    implements Insertable<DiaryRecordsTableData> {
  /// Drift が型安全な DataClass を生成するために PK が必要。
  /// アプリ内のフィルタは recordedAt で行うため、この値は直接使わない。
  final int rowId;

  /// Supabase UUID。saveLocally 時にクライアントで生成し、Supabase upsert の冪等キーとして使う。
  /// UNIQUE 制約により insertOrReplace が真に機能し、重複 INSERT を防ぐ。
  final String? id;

  /// 記録日時。UTC で保存し、読み出し時にローカル時刻に変換する。
  final DateTime recordedAt;

  /// 感情スライダー値（0.0〜1.0）
  final double moodSlider;

  /// 気分カラーの ARGB 値。未選択時は null。
  final int? moodColor;

  /// WeatherMeta の enum name 文字列。未選択時は null。
  final String? weather;

  /// List を JSON 文字列として格納する。
  /// SQLite に配列型がないため、1カラムに JSON で持つ。
  final String bodyParts;
  final String? sketchPath;
  final String? photoPath;
  final bool isSynced;
  const DiaryRecordsTableData({
    required this.rowId,
    this.id,
    required this.recordedAt,
    required this.moodSlider,
    this.moodColor,
    this.weather,
    required this.bodyParts,
    this.sketchPath,
    this.photoPath,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['row_id'] = Variable<int>(rowId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['mood_slider'] = Variable<double>(moodSlider);
    if (!nullToAbsent || moodColor != null) {
      map['mood_color'] = Variable<int>(moodColor);
    }
    if (!nullToAbsent || weather != null) {
      map['weather'] = Variable<String>(weather);
    }
    map['body_parts'] = Variable<String>(bodyParts);
    if (!nullToAbsent || sketchPath != null) {
      map['sketch_path'] = Variable<String>(sketchPath);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  DiaryRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return DiaryRecordsTableCompanion(
      rowId: Value(rowId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      recordedAt: Value(recordedAt),
      moodSlider: Value(moodSlider),
      moodColor: moodColor == null && nullToAbsent
          ? const Value.absent()
          : Value(moodColor),
      weather: weather == null && nullToAbsent
          ? const Value.absent()
          : Value(weather),
      bodyParts: Value(bodyParts),
      sketchPath: sketchPath == null && nullToAbsent
          ? const Value.absent()
          : Value(sketchPath),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      isSynced: Value(isSynced),
    );
  }

  factory DiaryRecordsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryRecordsTableData(
      rowId: serializer.fromJson<int>(json['rowId']),
      id: serializer.fromJson<String?>(json['id']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      moodSlider: serializer.fromJson<double>(json['moodSlider']),
      moodColor: serializer.fromJson<int?>(json['moodColor']),
      weather: serializer.fromJson<String?>(json['weather']),
      bodyParts: serializer.fromJson<String>(json['bodyParts']),
      sketchPath: serializer.fromJson<String?>(json['sketchPath']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowId': serializer.toJson<int>(rowId),
      'id': serializer.toJson<String?>(id),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'moodSlider': serializer.toJson<double>(moodSlider),
      'moodColor': serializer.toJson<int?>(moodColor),
      'weather': serializer.toJson<String?>(weather),
      'bodyParts': serializer.toJson<String>(bodyParts),
      'sketchPath': serializer.toJson<String?>(sketchPath),
      'photoPath': serializer.toJson<String?>(photoPath),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  DiaryRecordsTableData copyWith({
    int? rowId,
    Value<String?> id = const Value.absent(),
    DateTime? recordedAt,
    double? moodSlider,
    Value<int?> moodColor = const Value.absent(),
    Value<String?> weather = const Value.absent(),
    String? bodyParts,
    Value<String?> sketchPath = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    bool? isSynced,
  }) => DiaryRecordsTableData(
    rowId: rowId ?? this.rowId,
    id: id.present ? id.value : this.id,
    recordedAt: recordedAt ?? this.recordedAt,
    moodSlider: moodSlider ?? this.moodSlider,
    moodColor: moodColor.present ? moodColor.value : this.moodColor,
    weather: weather.present ? weather.value : this.weather,
    bodyParts: bodyParts ?? this.bodyParts,
    sketchPath: sketchPath.present ? sketchPath.value : this.sketchPath,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    isSynced: isSynced ?? this.isSynced,
  );
  DiaryRecordsTableData copyWithCompanion(DiaryRecordsTableCompanion data) {
    return DiaryRecordsTableData(
      rowId: data.rowId.present ? data.rowId.value : this.rowId,
      id: data.id.present ? data.id.value : this.id,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      moodSlider: data.moodSlider.present
          ? data.moodSlider.value
          : this.moodSlider,
      moodColor: data.moodColor.present ? data.moodColor.value : this.moodColor,
      weather: data.weather.present ? data.weather.value : this.weather,
      bodyParts: data.bodyParts.present ? data.bodyParts.value : this.bodyParts,
      sketchPath: data.sketchPath.present
          ? data.sketchPath.value
          : this.sketchPath,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiaryRecordsTableData(')
          ..write('rowId: $rowId, ')
          ..write('id: $id, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('moodSlider: $moodSlider, ')
          ..write('moodColor: $moodColor, ')
          ..write('weather: $weather, ')
          ..write('bodyParts: $bodyParts, ')
          ..write('sketchPath: $sketchPath, ')
          ..write('photoPath: $photoPath, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    rowId,
    id,
    recordedAt,
    moodSlider,
    moodColor,
    weather,
    bodyParts,
    sketchPath,
    photoPath,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryRecordsTableData &&
          other.rowId == this.rowId &&
          other.id == this.id &&
          other.recordedAt == this.recordedAt &&
          other.moodSlider == this.moodSlider &&
          other.moodColor == this.moodColor &&
          other.weather == this.weather &&
          other.bodyParts == this.bodyParts &&
          other.sketchPath == this.sketchPath &&
          other.photoPath == this.photoPath &&
          other.isSynced == this.isSynced);
}

class DiaryRecordsTableCompanion
    extends UpdateCompanion<DiaryRecordsTableData> {
  final Value<int> rowId;
  final Value<String?> id;
  final Value<DateTime> recordedAt;
  final Value<double> moodSlider;
  final Value<int?> moodColor;
  final Value<String?> weather;
  final Value<String> bodyParts;
  final Value<String?> sketchPath;
  final Value<String?> photoPath;
  final Value<bool> isSynced;
  const DiaryRecordsTableCompanion({
    this.rowId = const Value.absent(),
    this.id = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.moodSlider = const Value.absent(),
    this.moodColor = const Value.absent(),
    this.weather = const Value.absent(),
    this.bodyParts = const Value.absent(),
    this.sketchPath = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  DiaryRecordsTableCompanion.insert({
    this.rowId = const Value.absent(),
    this.id = const Value.absent(),
    required DateTime recordedAt,
    required double moodSlider,
    this.moodColor = const Value.absent(),
    this.weather = const Value.absent(),
    this.bodyParts = const Value.absent(),
    this.sketchPath = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.isSynced = const Value.absent(),
  }) : recordedAt = Value(recordedAt),
       moodSlider = Value(moodSlider);
  static Insertable<DiaryRecordsTableData> custom({
    Expression<int>? rowId,
    Expression<String>? id,
    Expression<DateTime>? recordedAt,
    Expression<double>? moodSlider,
    Expression<int>? moodColor,
    Expression<String>? weather,
    Expression<String>? bodyParts,
    Expression<String>? sketchPath,
    Expression<String>? photoPath,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (rowId != null) 'row_id': rowId,
      if (id != null) 'id': id,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (moodSlider != null) 'mood_slider': moodSlider,
      if (moodColor != null) 'mood_color': moodColor,
      if (weather != null) 'weather': weather,
      if (bodyParts != null) 'body_parts': bodyParts,
      if (sketchPath != null) 'sketch_path': sketchPath,
      if (photoPath != null) 'photo_path': photoPath,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  DiaryRecordsTableCompanion copyWith({
    Value<int>? rowId,
    Value<String?>? id,
    Value<DateTime>? recordedAt,
    Value<double>? moodSlider,
    Value<int?>? moodColor,
    Value<String?>? weather,
    Value<String>? bodyParts,
    Value<String?>? sketchPath,
    Value<String?>? photoPath,
    Value<bool>? isSynced,
  }) {
    return DiaryRecordsTableCompanion(
      rowId: rowId ?? this.rowId,
      id: id ?? this.id,
      recordedAt: recordedAt ?? this.recordedAt,
      moodSlider: moodSlider ?? this.moodSlider,
      moodColor: moodColor ?? this.moodColor,
      weather: weather ?? this.weather,
      bodyParts: bodyParts ?? this.bodyParts,
      sketchPath: sketchPath ?? this.sketchPath,
      photoPath: photoPath ?? this.photoPath,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rowId.present) {
      map['row_id'] = Variable<int>(rowId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (moodSlider.present) {
      map['mood_slider'] = Variable<double>(moodSlider.value);
    }
    if (moodColor.present) {
      map['mood_color'] = Variable<int>(moodColor.value);
    }
    if (weather.present) {
      map['weather'] = Variable<String>(weather.value);
    }
    if (bodyParts.present) {
      map['body_parts'] = Variable<String>(bodyParts.value);
    }
    if (sketchPath.present) {
      map['sketch_path'] = Variable<String>(sketchPath.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryRecordsTableCompanion(')
          ..write('rowId: $rowId, ')
          ..write('id: $id, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('moodSlider: $moodSlider, ')
          ..write('moodColor: $moodColor, ')
          ..write('weather: $weather, ')
          ..write('bodyParts: $bodyParts, ')
          ..write('sketchPath: $sketchPath, ')
          ..write('photoPath: $photoPath, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DiaryRecordsTableTable diaryRecordsTable =
      $DiaryRecordsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [diaryRecordsTable];
}

typedef $$DiaryRecordsTableTableCreateCompanionBuilder =
    DiaryRecordsTableCompanion Function({
      Value<int> rowId,
      Value<String?> id,
      required DateTime recordedAt,
      required double moodSlider,
      Value<int?> moodColor,
      Value<String?> weather,
      Value<String> bodyParts,
      Value<String?> sketchPath,
      Value<String?> photoPath,
      Value<bool> isSynced,
    });
typedef $$DiaryRecordsTableTableUpdateCompanionBuilder =
    DiaryRecordsTableCompanion Function({
      Value<int> rowId,
      Value<String?> id,
      Value<DateTime> recordedAt,
      Value<double> moodSlider,
      Value<int?> moodColor,
      Value<String?> weather,
      Value<String> bodyParts,
      Value<String?> sketchPath,
      Value<String?> photoPath,
      Value<bool> isSynced,
    });

class $$DiaryRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DiaryRecordsTableTable> {
  $$DiaryRecordsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get moodSlider => $composableBuilder(
    column: $table.moodSlider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moodColor => $composableBuilder(
    column: $table.moodColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weather => $composableBuilder(
    column: $table.weather,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyParts => $composableBuilder(
    column: $table.bodyParts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sketchPath => $composableBuilder(
    column: $table.sketchPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiaryRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DiaryRecordsTableTable> {
  $$DiaryRecordsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get moodSlider => $composableBuilder(
    column: $table.moodSlider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moodColor => $composableBuilder(
    column: $table.moodColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weather => $composableBuilder(
    column: $table.weather,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyParts => $composableBuilder(
    column: $table.bodyParts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sketchPath => $composableBuilder(
    column: $table.sketchPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiaryRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiaryRecordsTableTable> {
  $$DiaryRecordsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get rowId =>
      $composableBuilder(column: $table.rowId, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get moodSlider => $composableBuilder(
    column: $table.moodSlider,
    builder: (column) => column,
  );

  GeneratedColumn<int> get moodColor =>
      $composableBuilder(column: $table.moodColor, builder: (column) => column);

  GeneratedColumn<String> get weather =>
      $composableBuilder(column: $table.weather, builder: (column) => column);

  GeneratedColumn<String> get bodyParts =>
      $composableBuilder(column: $table.bodyParts, builder: (column) => column);

  GeneratedColumn<String> get sketchPath => $composableBuilder(
    column: $table.sketchPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$DiaryRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiaryRecordsTableTable,
          DiaryRecordsTableData,
          $$DiaryRecordsTableTableFilterComposer,
          $$DiaryRecordsTableTableOrderingComposer,
          $$DiaryRecordsTableTableAnnotationComposer,
          $$DiaryRecordsTableTableCreateCompanionBuilder,
          $$DiaryRecordsTableTableUpdateCompanionBuilder,
          (
            DiaryRecordsTableData,
            BaseReferences<
              _$AppDatabase,
              $DiaryRecordsTableTable,
              DiaryRecordsTableData
            >,
          ),
          DiaryRecordsTableData,
          PrefetchHooks Function()
        > {
  $$DiaryRecordsTableTableTableManager(
    _$AppDatabase db,
    $DiaryRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiaryRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiaryRecordsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiaryRecordsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> rowId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<double> moodSlider = const Value.absent(),
                Value<int?> moodColor = const Value.absent(),
                Value<String?> weather = const Value.absent(),
                Value<String> bodyParts = const Value.absent(),
                Value<String?> sketchPath = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => DiaryRecordsTableCompanion(
                rowId: rowId,
                id: id,
                recordedAt: recordedAt,
                moodSlider: moodSlider,
                moodColor: moodColor,
                weather: weather,
                bodyParts: bodyParts,
                sketchPath: sketchPath,
                photoPath: photoPath,
                isSynced: isSynced,
              ),
          createCompanionCallback:
              ({
                Value<int> rowId = const Value.absent(),
                Value<String?> id = const Value.absent(),
                required DateTime recordedAt,
                required double moodSlider,
                Value<int?> moodColor = const Value.absent(),
                Value<String?> weather = const Value.absent(),
                Value<String> bodyParts = const Value.absent(),
                Value<String?> sketchPath = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => DiaryRecordsTableCompanion.insert(
                rowId: rowId,
                id: id,
                recordedAt: recordedAt,
                moodSlider: moodSlider,
                moodColor: moodColor,
                weather: weather,
                bodyParts: bodyParts,
                sketchPath: sketchPath,
                photoPath: photoPath,
                isSynced: isSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiaryRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiaryRecordsTableTable,
      DiaryRecordsTableData,
      $$DiaryRecordsTableTableFilterComposer,
      $$DiaryRecordsTableTableOrderingComposer,
      $$DiaryRecordsTableTableAnnotationComposer,
      $$DiaryRecordsTableTableCreateCompanionBuilder,
      $$DiaryRecordsTableTableUpdateCompanionBuilder,
      (
        DiaryRecordsTableData,
        BaseReferences<
          _$AppDatabase,
          $DiaryRecordsTableTable,
          DiaryRecordsTableData
        >,
      ),
      DiaryRecordsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DiaryRecordsTableTableTableManager get diaryRecordsTable =>
      $$DiaryRecordsTableTableTableManager(_db, _db.diaryRecordsTable);
}
