// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassesResponse _$ClassesResponseFromJson(Map<String, dynamic> json) =>
    ClassesResponse(
      json['status'] as String?,
      (json['classes'] as List<dynamic>?)
          ?.map((e) => ClassesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassesResponseToJson(ClassesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'classes': instance.classes,
    };
