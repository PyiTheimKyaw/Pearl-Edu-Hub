import 'package:json_annotation/json_annotation.dart';

part 'live_session_vo.g.dart';

@JsonSerializable()
class LiveSessionVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'lecture_ids')
  final String? lectureIds;
  @JsonKey(name: 'meet_url')
  final String? meetUrl;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'class_id')
  final int? classId;

  LiveSessionVO(this.id, this.startTime, this.endTime, this.date,
      this.lectureIds, this.meetUrl, this.createdAt, this.classId);

  factory LiveSessionVO.fromJson(Map<String, dynamic> json) =>
      _$LiveSessionVOFromJson(json);

  Map<String, dynamic> toJson() => _$LiveSessionVOToJson(this);
}
