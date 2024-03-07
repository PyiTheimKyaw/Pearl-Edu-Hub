import 'dart:typed_data';

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
    return mPearlApi.createLiveSession(startTime ?? "", endTime ?? "", date ?? "", meetUrl ?? "",
        lectureIds?.join(",") ?? "", classId ?? 0, liveTitle ?? "");
  }

  @override
  Future<Uint8List> downloadCV() async {
    // return mICApi.downloadCV(currentResume);
    // try {
    // var token = await SharePreferenceUtils.getTokenString() ?? "";
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.1.5:8082/pearlEduHubApi",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.bytes,
        receiveTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );
    dio.options.contentType = "application/x-www-form-urlencoded";
    dio.interceptors.addAll({
      // TokenInterceptor(dio),
      ErrorHandler(dio),
    });
    Response response = await dio.get(
      'http://192.168.1.5:8082/pearlEduHubApi/image?id=2',
    );
    return response.data;
    // } catch (error) {
    //   print("Error download ${error.runtimeType}");
    //   final dioException = error as DioException;
    //   switch (dioException.type) {
    //     case DioExceptionType.connectionTimeout:
    //     case DioExceptionType.connectionError:
    //     case DioExceptionType.sendTimeout:
    //     case DioExceptionType.badCertificate:
    //     case DioExceptionType.receiveTimeout:
    //       throw DeadlineExceededException(dioException.requestOptions);
    //     case DioExceptionType.badResponse:
    //       switch (dioException.response?.statusCode) {
    //         case 422:
    //           throw BadRequestException(
    //               dioException.response, dioException.requestOptions);
    //         case 400:
    //           throw BadRequestException(
    //               dioException.response, dioException.requestOptions);
    //         case 401:
    //           throw UnauthorizedException(dioException.requestOptions);
    //         case 404:
    //           throw NotFoundException(dioException.requestOptions);
    //         case 409:
    //           throw ConflictException(dioException.requestOptions);
    //         case 429:
    //           throw TooManyRequestException(dioException.requestOptions);
    //         case 500:
    //           throw InternalServerErrorException(dioException.requestOptions);
    //       }
    //       break;
    //     case DioExceptionType.cancel:
    //       break;
    //     case DioExceptionType.unknown:
    //       throw InternalServerErrorException(dioException.requestOptions);
    //   }
    //   return Future.error(dioException);
    // }
  }
}
