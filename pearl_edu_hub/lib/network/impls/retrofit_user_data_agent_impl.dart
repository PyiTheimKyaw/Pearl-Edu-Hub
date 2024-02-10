import 'package:dio/dio.dart';
import 'package:pearl_edu_hub/network/data_agents/user_data_agent.dart';
import 'package:pearl_edu_hub/network/pearl_api.dart';
import 'package:pearl_edu_hub/network/responses/classes_response.dart';
import 'package:pearl_edu_hub/network/responses/students_response.dart';

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
    // dio.interceptors.addAll({
    //   TokenInterceptor(dio),
    //   ErrorHandler(dio),
    // });
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
}
