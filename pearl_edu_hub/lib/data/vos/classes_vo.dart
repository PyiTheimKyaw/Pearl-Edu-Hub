import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/enrollment_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/data/vos/live_session_vo.dart';
import 'package:pearl_edu_hub/utils/hive_constants.dart';

part 'classes_vo.g.dart';

@HiveType(
    typeId: kDashboardClassesVOHiveTypeId, adapterName: "ClassesVOAdapter")
@JsonSerializable()
class ClassesVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @JsonKey(name: 'class_name')
  @HiveField(1)
  final String? className;
  @JsonKey(name: 'classInfo')
  @HiveField(2)
  final String? classInfo;
  @JsonKey(name: 'startDate')
  @HiveField(3)
  final String? startDate;
  @JsonKey(name: 'endDate')
  @HiveField(4)
  final String? endDate;
  @JsonKey(name: 'fees')
  @HiveField(5)
  final double? fees;
  @JsonKey(name: 'lectures')
  @HiveField(6)
  final List<LectureVO> lectures;
  @JsonKey(name: 'enrollments')
  @HiveField(7)
  final List<EnrollmentVO>? enrollments;
  @JsonKey(name: 'liveSessions')
  @HiveField(8)
  final List<LiveSessionVO>? liveSessions;

  ClassesVO(
      this.id,
      this.className,
      this.classInfo,
      this.startDate,
      this.lectures,
      this.endDate,
      this.fees,
      this.enrollments,
      this.liveSessions);

  factory ClassesVO.fromJson(Map<String, dynamic> json) =>
      _$ClassesVOFromJson(json);

  Map<String, dynamic> toJson() => _$ClassesVOToJson(this);
}
