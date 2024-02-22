import 'package:dio/dio.dart';
import 'package:pearl_edu_hub/network/api_constants.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';
import 'package:pearl_edu_hub/network/responses/class_details_response.dart';
import 'package:pearl_edu_hub/network/responses/classes_response.dart';
import 'package:pearl_edu_hub/network/responses/lectures_response.dart';
import 'package:pearl_edu_hub/network/responses/students_response.dart';
import 'package:retrofit/retrofit.dart';

part 'pearl_api.g.dart';

@RestApi(baseUrl: "http://localhost:8082/pearlEduHubApi")
abstract class PearlApi {
  factory PearlApi(Dio dio) = _PearlApi;

  @GET(kEndPointGetClasses)
  Future<ClassesResponse> getFromJSP();

  @GET(kEndPointGetStudents)
  Future<StudentsResponse> getStudents();

  @POST(kEndPointCreateClass)
  Future<BaseResponse> createClass({
    @Field(kParamClassName) String? className,
    @Field(kParamClassFees) double? classFees,
    @Field(kParamClassInfo) String? classInfo,
    @Field(kParamStartDate) String? startDate,
    @Field(kParamEndDate) String? endDate,
    @Field(kParamLectureIds) String? lectureIds,
  });

  @GET(kEndPointGetLectures)
  Future<LecturesResponse> getLectures();

  @GET(kEndPointGetClassDetail)
  Future<ClassDetailsResponse> getClassDetail(
    @Query(kParamClassId) int classId,
  );
}