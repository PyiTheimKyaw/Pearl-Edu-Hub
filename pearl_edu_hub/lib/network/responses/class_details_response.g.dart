// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassDetailsResponse _$ClassDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ClassDetailsResponse(
      json['status'] as String?,
      json['class_detail'] == null
          ? null
          : ClassesVO.fromJson(json['class_detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClassDetailsResponseToJson(
        ClassDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'class_detail': instance.classDetail,
    };
