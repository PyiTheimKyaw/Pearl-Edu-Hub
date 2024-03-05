import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
part 'lectures_response.g.dart';
@JsonSerializable()
class LecturesResponse{
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'lectures')
  final List<LectureVO>? lectures;

  LecturesResponse(this.status, this.lectures);

  factory LecturesResponse.fromJson(Map<String, dynamic> json) =>
      _$LecturesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LecturesResponseToJson(this);
}