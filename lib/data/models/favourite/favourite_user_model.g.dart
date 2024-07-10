// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteUserModelImpl _$$FavouriteUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FavouriteUserModelImpl(
      emails:
          (json['emails'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$FavouriteUserModelImplToJson(
        _$FavouriteUserModelImpl instance) =>
    <String, dynamic>{
      'emails': instance.emails,
    };
