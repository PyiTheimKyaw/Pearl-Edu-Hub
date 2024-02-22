// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollmentVO _$EnrollmentVOFromJson(Map<String, dynamic> json) => EnrollmentVO(
      json['id'] as int?,
      json['student'] == null
          ? null
          : StudentVO.fromJson(json['student'] as Map<String, dynamic>),
      json['payment_type_id'] as int?,
      (json['amount'] as num?)?.toDouble(),
      json['created_at'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$EnrollmentVOToJson(EnrollmentVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'payment_type_id': instance.paymentTypeId,
      'amount': instance.amount,
      'created_at': instance.createdAt,
      'status': instance.status,
    };
