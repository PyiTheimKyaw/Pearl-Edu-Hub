import 'package:json_annotation/json_annotation.dart';

part 'classes_vo.g.dart';

@JsonSerializable()
class ClassesVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'class_name')
  final String? className;
  @JsonKey(name: 'classInfo')
  final String? classInfo;
  @JsonKey(name: 'startDate')
  final String? startDate;
  @JsonKey(name: 'endDate')
  final String? endDate;
  @JsonKey(name: 'fees')
  final double? fees;

  ClassesVO(this.id, this.className, this.classInfo, this.startDate,
      this.endDate, this.fees);

  factory ClassesVO.fromJson(Map<String, dynamic> json) =>
      _$ClassesVOFromJson(json);

  Map<String, dynamic> toJson() => _$ClassesVOToJson(this);
}
