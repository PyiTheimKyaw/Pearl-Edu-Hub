// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_session_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveSessionVO _$LiveSessionVOFromJson(Map<String, dynamic> json) =>
    LiveSessionVO(
      json['id'] as int?,
      json['start_time'] as String?,
      json['end_time'] as String?,
      json['date'] as String?,
      json['lecture_ids'] as String?,
      json['meet_url'] as String?,
      json['created_at'] as String?,
      json['class_id'] as int?,
    );

Map<String, dynamic> _$LiveSessionVOToJson(LiveSessionVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'date': instance.date,
      'lecture_ids': instance.lectureIds,
      'meet_url': instance.meetUrl,
      'created_at': instance.createdAt,
      'class_id': instance.classId,
    };
