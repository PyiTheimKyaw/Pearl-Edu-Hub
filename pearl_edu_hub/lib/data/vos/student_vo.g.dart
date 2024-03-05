// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentVOAdapter extends TypeAdapter<StudentVO> {
  @override
  final int typeId = 5;

  @override
  StudentVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phNum)
      ..writeByte(4)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
