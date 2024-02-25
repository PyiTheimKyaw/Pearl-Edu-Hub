// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LectureVOAdapter extends TypeAdapter<LectureVO> {
  @override
  final int typeId = 2;

  @override
  LectureVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LectureVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, LectureVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LectureVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
