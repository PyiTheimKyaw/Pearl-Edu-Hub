import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';
import 'package:pearl_edu_hub/utils/hive_constants.dart';

part 'enrollment_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kEnrollmentsVOHiveTypeId, adapterName: "EnrollmentVOAdapter")
class EnrollmentVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @JsonKey(name: 'student')
  @HiveField(1)
  final StudentVO? student;
  @JsonKey(name: 'payment_type_id')
  @HiveField(2)
  final int? paymentTypeId;
  @JsonKey(name: 'amount')
  @HiveField(3)
  final double? amount;
  @JsonKey(name: 'created_at')
  @HiveField(4)
  final String? createdAt;
  @JsonKey(name: 'status')
  @HiveField(5)
  final String? status;

  EnrollmentVO(this.id, this.student, this.paymentTypeId, this.amount,
      this.createdAt, this.status);

  factory EnrollmentVO.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentVOFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollmentVOToJson(this);
}
