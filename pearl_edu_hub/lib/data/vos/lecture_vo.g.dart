// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureVO _$LectureVOFromJson(Map<String, dynamic> json) => LectureVO(
      json['id'] as int?,
      json['lecture_name'] as String?,
      json['isSelected'] as bool?,
    );

Map<String, dynamic> _$LectureVOToJson(LectureVO instance) => <String, dynamic>{
      'id': instance.id,
      'lecture_name': instance.name,
      'isSelected': instance.isSelected,
    };
