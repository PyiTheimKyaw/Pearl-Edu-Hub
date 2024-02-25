// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorVO _$ErrorVOFromJson(Map<String, dynamic> json) => ErrorVO(
      json['date'] as String?,
      json['start_time'] as String?,
      json['end_time'] as String?,
      json['lecture_ids'] as String?,
      json['class_id'] as String?,
      json['meet_url'] as String?,
    );

Map<String, dynamic> _$ErrorVOToJson(ErrorVO instance) => <String, dynamic>{
      'date': instance.date,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'lecture_ids': instance.lectureIds,
      'class_id': instance.classId,
      'meet_url': instance.meetUrl,
    };
