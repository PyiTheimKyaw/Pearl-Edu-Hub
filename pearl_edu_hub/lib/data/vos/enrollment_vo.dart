import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';

part 'enrollment_vo.g.dart';

@JsonSerializable()
class EnrollmentVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'student')
  final StudentVO? student;
  @JsonKey(name: 'payment_type_id')
  final int? paymentTypeId;
  @JsonKey(name: 'amount')
  final double? amount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'status')
  final String? status;

  EnrollmentVO(this.id, this.student, this.paymentTypeId, this.amount,
      this.createdAt, this.status);

  factory EnrollmentVO.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentVOFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollmentVOToJson(this);
}
