import 'package:json_annotation/json_annotation.dart';
import 'package:pearl_edu_hub/data/vos/error_vo.dart';
part 'errors_response.g.dart';
@JsonSerializable()
class ErrorsResponse{
  @JsonKey(name: 'errors')
  final ErrorVO? errors;

  ErrorsResponse(this.errors);

  factory ErrorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsResponseToJson(this);
}