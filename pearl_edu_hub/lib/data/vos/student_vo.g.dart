// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentVO _$StudentVOFromJson(Map<String, dynamic> json) => StudentVO(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['ph_num'] as String?,
      json['address'] as String?,
    );

Map<String, dynamic> _$StudentVOToJson(StudentVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'ph_num': instance.phNum,
      'address': instance.address,
    };
