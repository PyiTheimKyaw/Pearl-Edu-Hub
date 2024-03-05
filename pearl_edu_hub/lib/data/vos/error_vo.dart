import 'package:json_annotation/json_annotation.dart';

part 'error_vo.g.dart';

@JsonSerializable()
class ErrorVO {
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'lecture_ids')
  final String? lectureIds;
  @JsonKey(name: 'class_id')
  final String? classId;
  @JsonKey(name: 'meet_url')
  final String? meetUrl;

  ErrorVO(this.date, this.startTime, this.endTime, this.lectureIds,
      this.classId, this.meetUrl);

  factory ErrorVO.fromJson(Map<String, dynamic> json) =>
      _$ErrorVOFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorVOToJson(this);
}
