import 'package:pearl_edu_hub/network/responses/base_response.dart';
import 'package:pearl_edu_hub/network/responses/class_details_response.dart';
import 'package:pearl_edu_hub/network/responses/classes_response.dart';
import 'package:pearl_edu_hub/network/responses/lectures_response.dart';
import 'package:pearl_edu_hub/network/responses/students_response.dart';

abstract class UserDataAgent {
  Future<ClassesResponse> getClassesForAdmin();

  Future<StudentsResponse> getStudents();

  Future<BaseResponse> createClass(
      {String? className,
      double? classFees,
      String? classInfo,
      String? startDate,
      String? endDate,
      List<int>? lectureIds});

  Future<LecturesResponse> getLectures();

  Future<ClassDetailsResponse> getClassDetail({required int classId});

  Future<BaseResponse> createLiveSession({
    String? startTime,
    String? endTime,
    String? date,
    String? meetUrl,
    List<int>? lectureIds,
    int? classId,
  });
}
