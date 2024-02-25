// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnrollmentVOAdapter extends TypeAdapter<EnrollmentVO> {
  @override
  final int typeId = 3;

  @override
  EnrollmentVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnrollmentVO(
      fields[0] as int?,
      fields[1] as StudentVO?,
      fields[2] as int?,
      fields[3] as double?,
      fields[4] as String?,
      fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EnrollmentVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.student)
      ..writeByte(2)
      ..write(obj.paymentTypeId)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnrollmentVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
