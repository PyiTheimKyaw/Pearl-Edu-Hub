import 'dart:typed_data';

import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';

abstract class UserDataModel {
  void getClassesForDashboard();

  Future<List<StudentVO>?> getStudentsForAdmin();

  Future<BaseResponse> createClass(
      {String? className,
      double? classFees,
      String? classInfo,
      String? startDate,
      String? endDate,
      List<int>? lectureIds});

  Future<List<LectureVO>?> getLectures();

  void getClassDetail({required int classId});

  Future<BaseResponse> createLiveSession({
    String? startTime,
    String? endTime,
    String? date,
    String? meetUrl,
    List<int>? lectureIds,
    int? classId,
    String? liveTitle,
  });

//   From persistence
  Stream<List<ClassesVO>?> getDashboardClassesVoFromDatabase();

  Stream<ClassesVO?> getClassDetailFromDatabase({required int classId});

  Future<Uint8List> downloadCV();

}
