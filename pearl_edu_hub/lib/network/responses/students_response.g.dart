// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsResponse _$StudentsResponseFromJson(Map<String, dynamic> json) =>
    StudentsResponse(
      json['status'] as String?,
      (json['students'] as List<dynamic>?)
          ?.map((e) => StudentVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentsResponseToJson(StudentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'students': instance.students,
    };
