// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_session_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LiveSessionVOAdapter extends TypeAdapter<LiveSessionVO> {
  @override
  final int typeId = 4;

  @override
  LiveSessionVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LiveSessionVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LiveSessionVO obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.lectureIds)
      ..writeByte(5)
      ..write(obj.meetUrl)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.classId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LiveSessionVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
