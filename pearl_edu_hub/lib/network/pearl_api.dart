import 'package:dio/dio.dart';
import 'package:pearl_edu_hub/network/responses/classes_response.dart';
import 'package:pearl_edu_hub/network/responses/students_response.dart';
import 'package:retrofit/retrofit.dart';

part 'pearl_api.g.dart';

@RestApi(baseUrl: "http://localhost:8082/pearlEduHubApi")
abstract class PearlApi {
  factory PearlApi(Dio dio) = _PearlApi;

  @GET("/get-classes")
  Future<ClassesResponse> getFromJSP();

  @GET("/get-students")
  Future<StudentsResponse> getStudents();
}
