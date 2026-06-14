// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryRecord {

/// Supabase の UUID。ローカル保存中は null
 String? get id;/// 記録日時
 DateTime get recordedAt;/// 感情スライダー値。0.0（どんより）〜 1.0（すっきり）
/// 唯一の必須入力。他はすべて任意
 double get moodSlider;/// 気分を色で表現した ARGB 値。null = 未選択
 int? get moodColor;/// 天気メタファー。null = 未選択
 WeatherMeta? get weather;/// ボディマップで選択した体の部位 ID リスト。null = 未選択
 List<String> get bodyParts;/// スケッチ画像のローカルパス。null = 未描画
 String? get sketchPath;/// 写真のローカルパス。null = 未選択
 String? get photoPath;/// Supabase に同期済みか。ローカル保存直後は false
 bool get isSynced;
/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryRecordCopyWith<DiaryRecord> get copyWith => _$DiaryRecordCopyWithImpl<DiaryRecord>(this as DiaryRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.moodSlider, moodSlider) || other.moodSlider == moodSlider)&&(identical(other.moodColor, moodColor) || other.moodColor == moodColor)&&(identical(other.weather, weather) || other.weather == weather)&&const DeepCollectionEquality().equals(other.bodyParts, bodyParts)&&(identical(other.sketchPath, sketchPath) || other.sketchPath == sketchPath)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}


@override
int get hashCode => Object.hash(runtimeType,id,recordedAt,moodSlider,moodColor,weather,const DeepCollectionEquality().hash(bodyParts),sketchPath,photoPath,isSynced);

@override
String toString() {
  return 'DiaryRecord(id: $id, recordedAt: $recordedAt, moodSlider: $moodSlider, moodColor: $moodColor, weather: $weather, bodyParts: $bodyParts, sketchPath: $sketchPath, photoPath: $photoPath, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class $DiaryRecordCopyWith<$Res>  {
  factory $DiaryRecordCopyWith(DiaryRecord value, $Res Function(DiaryRecord) _then) = _$DiaryRecordCopyWithImpl;
@useResult
$Res call({
 String? id, DateTime recordedAt, double moodSlider, int? moodColor, WeatherMeta? weather, List<String> bodyParts, String? sketchPath, String? photoPath, bool isSynced
});




}
/// @nodoc
class _$DiaryRecordCopyWithImpl<$Res>
    implements $DiaryRecordCopyWith<$Res> {
  _$DiaryRecordCopyWithImpl(this._self, this._then);

  final DiaryRecord _self;
  final $Res Function(DiaryRecord) _then;

/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? recordedAt = null,Object? moodSlider = null,Object? moodColor = freezed,Object? weather = freezed,Object? bodyParts = null,Object? sketchPath = freezed,Object? photoPath = freezed,Object? isSynced = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,moodSlider: null == moodSlider ? _self.moodSlider : moodSlider // ignore: cast_nullable_to_non_nullable
as double,moodColor: freezed == moodColor ? _self.moodColor : moodColor // ignore: cast_nullable_to_non_nullable
as int?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherMeta?,bodyParts: null == bodyParts ? _self.bodyParts : bodyParts // ignore: cast_nullable_to_non_nullable
as List<String>,sketchPath: freezed == sketchPath ? _self.sketchPath : sketchPath // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaryRecord].
extension DiaryRecordPatterns on DiaryRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryRecord value)  $default,){
final _that = this;
switch (_that) {
case _DiaryRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryRecord value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  DateTime recordedAt,  double moodSlider,  int? moodColor,  WeatherMeta? weather,  List<String> bodyParts,  String? sketchPath,  String? photoPath,  bool isSynced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
return $default(_that.id,_that.recordedAt,_that.moodSlider,_that.moodColor,_that.weather,_that.bodyParts,_that.sketchPath,_that.photoPath,_that.isSynced);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  DateTime recordedAt,  double moodSlider,  int? moodColor,  WeatherMeta? weather,  List<String> bodyParts,  String? sketchPath,  String? photoPath,  bool isSynced)  $default,) {final _that = this;
switch (_that) {
case _DiaryRecord():
return $default(_that.id,_that.recordedAt,_that.moodSlider,_that.moodColor,_that.weather,_that.bodyParts,_that.sketchPath,_that.photoPath,_that.isSynced);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  DateTime recordedAt,  double moodSlider,  int? moodColor,  WeatherMeta? weather,  List<String> bodyParts,  String? sketchPath,  String? photoPath,  bool isSynced)?  $default,) {final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
return $default(_that.id,_that.recordedAt,_that.moodSlider,_that.moodColor,_that.weather,_that.bodyParts,_that.sketchPath,_that.photoPath,_that.isSynced);case _:
  return null;

}
}

}

/// @nodoc


class _DiaryRecord implements DiaryRecord {
  const _DiaryRecord({this.id, required this.recordedAt, required this.moodSlider, this.moodColor, this.weather, final  List<String> bodyParts = const [], this.sketchPath, this.photoPath, this.isSynced = false}): _bodyParts = bodyParts;
  

/// Supabase の UUID。ローカル保存中は null
@override final  String? id;
/// 記録日時
@override final  DateTime recordedAt;
/// 感情スライダー値。0.0（どんより）〜 1.0（すっきり）
/// 唯一の必須入力。他はすべて任意
@override final  double moodSlider;
/// 気分を色で表現した ARGB 値。null = 未選択
@override final  int? moodColor;
/// 天気メタファー。null = 未選択
@override final  WeatherMeta? weather;
/// ボディマップで選択した体の部位 ID リスト。null = 未選択
 final  List<String> _bodyParts;
/// ボディマップで選択した体の部位 ID リスト。null = 未選択
@override@JsonKey() List<String> get bodyParts {
  if (_bodyParts is EqualUnmodifiableListView) return _bodyParts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bodyParts);
}

/// スケッチ画像のローカルパス。null = 未描画
@override final  String? sketchPath;
/// 写真のローカルパス。null = 未選択
@override final  String? photoPath;
/// Supabase に同期済みか。ローカル保存直後は false
@override@JsonKey() final  bool isSynced;

/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryRecordCopyWith<_DiaryRecord> get copyWith => __$DiaryRecordCopyWithImpl<_DiaryRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.moodSlider, moodSlider) || other.moodSlider == moodSlider)&&(identical(other.moodColor, moodColor) || other.moodColor == moodColor)&&(identical(other.weather, weather) || other.weather == weather)&&const DeepCollectionEquality().equals(other._bodyParts, _bodyParts)&&(identical(other.sketchPath, sketchPath) || other.sketchPath == sketchPath)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}


@override
int get hashCode => Object.hash(runtimeType,id,recordedAt,moodSlider,moodColor,weather,const DeepCollectionEquality().hash(_bodyParts),sketchPath,photoPath,isSynced);

@override
String toString() {
  return 'DiaryRecord(id: $id, recordedAt: $recordedAt, moodSlider: $moodSlider, moodColor: $moodColor, weather: $weather, bodyParts: $bodyParts, sketchPath: $sketchPath, photoPath: $photoPath, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class _$DiaryRecordCopyWith<$Res> implements $DiaryRecordCopyWith<$Res> {
  factory _$DiaryRecordCopyWith(_DiaryRecord value, $Res Function(_DiaryRecord) _then) = __$DiaryRecordCopyWithImpl;
@override @useResult
$Res call({
 String? id, DateTime recordedAt, double moodSlider, int? moodColor, WeatherMeta? weather, List<String> bodyParts, String? sketchPath, String? photoPath, bool isSynced
});




}
/// @nodoc
class __$DiaryRecordCopyWithImpl<$Res>
    implements _$DiaryRecordCopyWith<$Res> {
  __$DiaryRecordCopyWithImpl(this._self, this._then);

  final _DiaryRecord _self;
  final $Res Function(_DiaryRecord) _then;

/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? recordedAt = null,Object? moodSlider = null,Object? moodColor = freezed,Object? weather = freezed,Object? bodyParts = null,Object? sketchPath = freezed,Object? photoPath = freezed,Object? isSynced = null,}) {
  return _then(_DiaryRecord(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,moodSlider: null == moodSlider ? _self.moodSlider : moodSlider // ignore: cast_nullable_to_non_nullable
as double,moodColor: freezed == moodColor ? _self.moodColor : moodColor // ignore: cast_nullable_to_non_nullable
as int?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherMeta?,bodyParts: null == bodyParts ? _self._bodyParts : bodyParts // ignore: cast_nullable_to_non_nullable
as List<String>,sketchPath: freezed == sketchPath ? _self.sketchPath : sketchPath // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
