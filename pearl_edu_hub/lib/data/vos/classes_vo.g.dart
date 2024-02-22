// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassesVO _$ClassesVOFromJson(Map<String, dynamic> json) => ClassesVO(
      json['id'] as int?,
      json['class_name'] as String?,
      json['classInfo'] as String?,
      json['startDate'] as String?,
      (json['lectures'] as List<dynamic>)
          .map((e) => LectureVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['endDate'] as String?,
      (json['fees'] as num?)?.toDouble(),
      (json['enrollments'] as List<dynamic>?)
          ?.map((e) => EnrollmentVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassesVOToJson(ClassesVO instance) => <String, dynamic>{
      'id': instance.id,
      'class_name': instance.className,
      'classInfo': instance.classInfo,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'fees': instance.fees,
      'lectures': instance.lectures,
      'enrollments': instance.enrollments,
    };
