import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';

part 'classes_response.g.dart';

@JsonSerializable()
class ClassesResponse {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'classes')
  final List<ClassesVO>? classes;

  ClassesResponse(this.status, this.classes);

  factory ClassesResponse.fromJson(Map<String, dynamic> json) =>
      _$ClassesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClassesResponseToJson(this);
}
