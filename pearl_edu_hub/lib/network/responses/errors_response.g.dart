// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorsResponse _$ErrorsResponseFromJson(Map<String, dynamic> json) =>
    ErrorsResponse(
      json['errors'] == null
          ? null
          : ErrorVO.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorsResponseToJson(ErrorsResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
