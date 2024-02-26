import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pearl_edu_hub/network/api_constants.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';
import 'package:pearl_edu_hub/network/responses/class_details_response.dart';
import 'package:pearl_edu_hub/network/responses/classes_response.dart';
import 'package:pearl_edu_hub/network/responses/lectures_response.dart';
import 'package:pearl_edu_hub/network/responses/students_response.dart';
import 'package:retrofit/retrofit.dart';

part 'pearl_api.g.dart';

@RestApi(
    baseUrl:
    // kIsWeb
    //     ? "http://localhost:8082/pearlEduHubApi"
    //     :
    "http://192.168.1.3:8082/pearlEduHubApi"
)
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

  @POST(kEndPointCreateLiveSession)
  Future<BaseResponse> createLiveSession(
    @Query(kParamStartTime) String startTime,
    @Query(kParamEndTime) String endTime,
    @Query(kParamDate) String date,
    @Query(kParamMeetUrl) String meetUrl,
    @Query(kParamLectureIds) String lectureIds,
    @Query(kParamClassId) int classId,
    @Query(kParamLiveTitle) String liveTitle,
  );
}
