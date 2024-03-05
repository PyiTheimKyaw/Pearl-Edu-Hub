import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';

part 'students_response.g.dart';

@JsonSerializable()
class StudentsResponse {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'students')
  final List<StudentVO>? students;

  StudentsResponse(this.status, this.students);

  factory StudentsResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsResponseToJson(this);
}
