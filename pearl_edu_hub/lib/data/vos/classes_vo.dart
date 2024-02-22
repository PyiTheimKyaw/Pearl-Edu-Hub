import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/enrollment_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';

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
  @JsonKey(name: 'lectures')
  final List<LectureVO> lectures;
  @JsonKey(name: 'enrollments')
  final List<EnrollmentVO>? enrollments;

  ClassesVO(this.id, this.className, this.classInfo, this.startDate,
      this.lectures, this.endDate, this.fees, this.enrollments);

  factory ClassesVO.fromJson(Map<String, dynamic> json) =>
      _$ClassesVOFromJson(json);

  Map<String, dynamic> toJson() => _$ClassesVOToJson(this);
}
