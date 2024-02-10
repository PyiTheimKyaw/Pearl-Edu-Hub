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
      json['endDate'] as String?,
      (json['fees'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClassesVOToJson(ClassesVO instance) => <String, dynamic>{
      'id': instance.id,
      'class_name': instance.className,
      'classInfo': instance.classInfo,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'fees': instance.fees,
    };
