import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';
import 'package:pearl_edu_hub/network/data_agents/user_data_agent.dart';
import 'package:pearl_edu_hub/network/impls/retrofit_user_data_agent_impl.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';

class UserDataModel {
  static UserDataModel? _instance;

  factory UserDataModel() {
    _instance ??= UserDataModel._internal();
    return _instance!;
  }

  UserDataModel._internal();

  final UserDataAgent userDataAgent = RetrofitUserDataAgentImpl();

  Future<List<ClassesVO>?> getClassesForAdmin() {
    return userDataAgent.getClassesForAdmin().then((value) => value.classes);
  }

  Future<List<StudentVO>?> getStudentsForAdmin() {
    return userDataAgent.getStudents().then((value) => value.students);
  }

  Future<BaseResponse> createClass(
      {String? className,
      double? classFees,
      String? classInfo,
      String? startDate,
      String? endDate,
      List<int>? lectureIds}) {
    return userDataAgent.createClass(
        className: className,
        classFees: classFees,
        classInfo: classInfo,
        startDate: startDate,
        endDate: endDate,
        lectureIds: lectureIds);
  }

  Future<List<LectureVO>?> getLectures() {
    return userDataAgent.getLectures().then((value) => value.lectures);
  }

  Future<ClassesVO?> getClassDetail({required int classId}) {
    return userDataAgent
        .getClassDetail(classId: classId)
        .then((value) => value.classDetail);
  }

  Future<BaseResponse> createLiveSession({
    String? startTime,
    String? endTime,
    String? date,
    String? meetUrl,
    List<int>? lectureIds,
    int? classId,
  }) {
    return userDataAgent.createLiveSession(
        startTime: startTime,
        endTime: endTime,
        date: date,
        meetUrl: meetUrl,
        lectureIds: lectureIds,
        classId: classId);
  }
}
