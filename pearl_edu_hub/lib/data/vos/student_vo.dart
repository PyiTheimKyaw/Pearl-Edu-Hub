import 'package:json_annotation/json_annotation.dart';

part 'student_vo.g.dart';

@JsonSerializable()
class StudentVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'ph_num')
  final String? phNum;
  @JsonKey(name: 'address')
  final String? address;

  StudentVO(this.id, this.name, this.email, this.phNum, this.address);

  factory StudentVO.fromJson(Map<String, dynamic> json) =>
      _$StudentVOFromJson(json);

  Map<String, dynamic> toJson() => _$StudentVOToJson(this);
}
