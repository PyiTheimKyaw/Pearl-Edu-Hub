// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lectures_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LecturesResponse _$LecturesResponseFromJson(Map<String, dynamic> json) =>
    LecturesResponse(
      json['status'] as String?,
      (json['lectures'] as List<dynamic>?)
          ?.map((e) => LectureVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LecturesResponseToJson(LecturesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'lectures': instance.lectures,
    };
