import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/utils/hive_constants.dart';

part 'student_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kStudentVOHiveTypeId, adapterName: "StudentVOAdapter")
class StudentVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  final int? id;
  @JsonKey(name: 'name')
  @HiveField(1)
  final String? name;
  @JsonKey(name: 'email')
  @HiveField(2)
  final String? email;
  @JsonKey(name: 'ph_num')
  @HiveField(3)
  final String? phNum;
  @JsonKey(name: 'address')
  @HiveField(4)
  final String? address;

  StudentVO(this.id, this.name, this.email, this.phNum, this.address);

  factory StudentVO.fromJson(Map<String, dynamic> json) =>
      _$StudentVOFromJson(json);

  Map<String, dynamic> toJson() => _$StudentVOToJson(this);
}
