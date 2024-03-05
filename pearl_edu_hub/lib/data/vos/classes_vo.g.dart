// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClassesVOAdapter extends TypeAdapter<ClassesVO> {
  @override
  final int typeId = 1;

  @override
  ClassesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClassesVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      (fields[6] as List).cast<LectureVO>(),
      fields[4] as String?,
      fields[5] as double?,
      (fields[7] as List?)?.cast<EnrollmentVO>(),
      (fields[8] as List?)?.cast<LiveSessionVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ClassesVO obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.className)
      ..writeByte(2)
      ..write(obj.classInfo)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.endDate)
      ..writeByte(5)
      ..write(obj.fees)
      ..writeByte(6)
      ..write(obj.lectures)
      ..writeByte(7)
      ..write(obj.enrollments)
      ..writeByte(8)
      ..write(obj.liveSessions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      (json['liveSessions'] as List<dynamic>?)
          ?.map((e) => LiveSessionVO.fromJson(e as Map<String, dynamic>))
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
      'liveSessions': instance.liveSessions,
    };
