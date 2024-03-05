import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/utils/hive_constants.dart';

part 'lecture_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kLecturesVOHiveTypeId, adapterName: "LectureVOAdapter")
class LectureVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @JsonKey(name: 'lecture_name')
  @HiveField(1)
  final String? name;
  @JsonKey(name: 'isSelected')
  @HiveField(2)
  bool? isSelected;

  LectureVO(this.id, this.name, this.isSelected);

  factory LectureVO.fromJson(Map<String, dynamic> json) =>
      _$LectureVOFromJson(json);

  Map<String, dynamic> toJson() => _$LectureVOToJson(this);
}
