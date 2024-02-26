import 'package:dio/dio.dart';
import 'package:pearl_edu_hub/network/data_agents/user_data_agent.dart';
import 'package:pearl_edu_hub/network/pearl_api.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';
import 'package:pearl_edu_hub/network/responses/class_details_response.dart';
import 'package:pearl_edu_hub/network/responses/classes_response.dart';
import 'package:pearl_edu_hub/network/responses/lectures_response.dart';
import 'package:pearl_edu_hub/network/responses/students_response.dart';
import 'package:pearl_edu_hub/utils/error_handler.dart';

class RetrofitUserDataAgentImpl extends UserDataAgent {
  static RetrofitUserDataAgentImpl? instance;

  factory RetrofitUserDataAgentImpl() {
    instance ??= RetrofitUserDataAgentImpl._internal();
    return instance!;
  }

  late PearlApi mPearlApi;

  RetrofitUserDataAgentImpl._internal() {
    final dio = createTokenDao();
    mPearlApi = PearlApi(dio);
  }

  static Dio createTokenDao() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://localhost:8082/pearlEduHubApi",
        headers: {
          "Accept": "application/json",
        },
        // receiveTimeout: const Duration(seconds: 15),
        // connectTimeout: const Duration(seconds: 15),
        // sendTimeout: const Duration(seconds: 15),
      ),
    );
    dio.options.contentType = "application/x-www-form-urlencoded";
    dio.interceptors.addAll({
      //   TokenInterceptor(dio),
      ErrorHandler(dio),
    });
    return dio;
  }

  @override
  Future<ClassesResponse> getClassesForAdmin() {
    return mPearlApi.getFromJSP();
  }

  @override
  Future<StudentsResponse> getStudents() {
    return mPearlApi.getStudents();
  }

  @override
  Future<BaseResponse> createClass(
      {String? className,
      double? classFees,
      String? classInfo,
      String? startDate,
      String? endDate,
      List<int>? lectureIds}) {
    return mPearlApi.createClass(
        className: className,
        classFees: classFees,
        classInfo: classInfo,
        startDate: startDate,
        endDate: endDate,
        lectureIds: lectureIds?.join(","));
  }

  @override
  Future<LecturesResponse> getLectures() {
    return mPearlApi.getLectures();
  }

  @override
  Future<ClassDetailsResponse> getClassDetail({required int classId}) {
    return mPearlApi.getClassDetail(classId);
  }

  @override
  Future<BaseResponse> createLiveSession({
    String? startTime,
    String? endTime,
    String? date,
    String? meetUrl,
    List<int>? lectureIds,
    int? classId,
    String? liveTitle,
  }) {
    return mPearlApi.createLiveSession(
        startTime ?? "",
        endTime ?? "",
        date ?? "",
        meetUrl ?? "",
        lectureIds?.join(",") ?? "",
        classId ?? 0,
        liveTitle ?? "");
  }
}
