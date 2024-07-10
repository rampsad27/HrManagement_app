// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavouriteUserModel _$FavouriteUserModelFromJson(Map<String, dynamic> json) {
  return _FavouriteUserModel.fromJson(json);
}

/// @nodoc
mixin _$FavouriteUserModel {
  List<String> get emails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteUserModelCopyWith<FavouriteUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteUserModelCopyWith<$Res> {
  factory $FavouriteUserModelCopyWith(
          FavouriteUserModel value, $Res Function(FavouriteUserModel) then) =
      _$FavouriteUserModelCopyWithImpl<$Res, FavouriteUserModel>;
  @useResult
  $Res call({List<String> emails});
}

/// @nodoc
class _$FavouriteUserModelCopyWithImpl<$Res, $Val extends FavouriteUserModel>
    implements $FavouriteUserModelCopyWith<$Res> {
  _$FavouriteUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emails = null,
  }) {
    return _then(_value.copyWith(
      emails: null == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteUserModelImplCopyWith<$Res>
    implements $FavouriteUserModelCopyWith<$Res> {
  factory _$$FavouriteUserModelImplCopyWith(_$FavouriteUserModelImpl value,
          $Res Function(_$FavouriteUserModelImpl) then) =
      __$$FavouriteUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> emails});
}

/// @nodoc
class __$$FavouriteUserModelImplCopyWithImpl<$Res>
    extends _$FavouriteUserModelCopyWithImpl<$Res, _$FavouriteUserModelImpl>
    implements _$$FavouriteUserModelImplCopyWith<$Res> {
  __$$FavouriteUserModelImplCopyWithImpl(_$FavouriteUserModelImpl _value,
      $Res Function(_$FavouriteUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emails = null,
  }) {
    return _then(_$FavouriteUserModelImpl(
      emails: null == emails
          ? _value._emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavouriteUserModelImpl implements _FavouriteUserModel {
  const _$FavouriteUserModelImpl({required final List<String> emails})
      : _emails = emails;

  factory _$FavouriteUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteUserModelImplFromJson(json);

  final List<String> _emails;
  @override
  List<String> get emails {
    if (_emails is EqualUnmodifiableListView) return _emails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emails);
  }

  @override
  String toString() {
    return 'FavouriteUserModel(emails: $emails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteUserModelImpl &&
            const DeepCollectionEquality().equals(other._emails, _emails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_emails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteUserModelImplCopyWith<_$FavouriteUserModelImpl> get copyWith =>
      __$$FavouriteUserModelImplCopyWithImpl<_$FavouriteUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteUserModelImplToJson(
      this,
    );
  }
}

abstract class _FavouriteUserModel implements FavouriteUserModel {
  const factory _FavouriteUserModel({required final List<String> emails}) =
      _$FavouriteUserModelImpl;

  factory _FavouriteUserModel.fromJson(Map<String, dynamic> json) =
      _$FavouriteUserModelImpl.fromJson;

  @override
  List<String> get emails;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteUserModelImplCopyWith<_$FavouriteUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
