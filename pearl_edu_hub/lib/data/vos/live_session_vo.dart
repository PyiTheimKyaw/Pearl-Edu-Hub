import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/utils/hive_constants.dart';

part 'live_session_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kLiveSessionVOHiveTypeId, adapterName: "LiveSessionVOAdapter")
class LiveSessionVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @JsonKey(name: 'start_time')
  @HiveField(1)
  final String? startTime;
  @JsonKey(name: 'end_time')
  @HiveField(2)
  final String? endTime;
  @JsonKey(name: 'date')
  @HiveField(3)
  final String? date;
  @JsonKey(name: 'lecture_ids')
  @HiveField(4)
  final String? lectureIds;
  @JsonKey(name: 'meet_url')
  @HiveField(5)
  final String? meetUrl;
  @JsonKey(name: 'created_at')
  @HiveField(6)
  final String? createdAt;
  @JsonKey(name: 'class_id')
  @HiveField(7)
  final int? classId;

  LiveSessionVO(this.id, this.startTime, this.endTime, this.date,
      this.lectureIds, this.meetUrl, this.createdAt, this.classId);

  factory LiveSessionVO.fromJson(Map<String, dynamic> json) =>
      _$LiveSessionVOFromJson(json);

  Map<String, dynamic> toJson() => _$LiveSessionVOToJson(this);
}
