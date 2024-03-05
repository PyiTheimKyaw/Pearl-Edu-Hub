import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
part 'class_details_response.g.dart';
@JsonSerializable()
class ClassDetailsResponse{
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'class_detail')
  final ClassesVO? classDetail;

  ClassDetailsResponse(this.status, this.classDetail);
  factory ClassDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ClassDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClassDetailsResponseToJson(this);
}