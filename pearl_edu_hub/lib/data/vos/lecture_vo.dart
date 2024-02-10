import 'package:json_annotation/json_annotation.dart';

part 'lecture_vo.g.dart';

@JsonSerializable()
class LectureVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'lecture_name')
  final String? name;
  @JsonKey(name: 'isSelected')
  bool? isSelected;

  LectureVO(this.id, this.name, this.isSelected);

  factory LectureVO.fromJson(Map<String, dynamic> json) =>
      _$LectureVOFromJson(json);

  Map<String, dynamic> toJson() => _$LectureVOToJson(this);
}
