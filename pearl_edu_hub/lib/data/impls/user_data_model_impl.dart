import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';
import 'package:pearl_edu_hub/network/data_agents/user_data_agent.dart';
import 'package:pearl_edu_hub/network/impls/retrofit_user_data_agent_impl.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';
import 'package:pearl_edu_hub/persistence/dao_impls/dashboard_dao_impls/dashboard_classes_dao_impl.dart';
import 'package:pearl_edu_hub/persistence/daos/dashboard_daos/classes_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class UserDataModelImpl extends UserDataModel {
  static UserDataModelImpl? _instance;

  factory UserDataModelImpl() {
    _instance ??= UserDataModelImpl._internal();
    return _instance!;
  }

  UserDataModelImpl._internal();

  final UserDataAgent _userDataAgent = RetrofitUserDataAgentImpl();
  final DashboardClassesDao _dashboardClassesDao = DashboardClassesDaoImpl();

  @override
  void getClassesForDashboard() {
    _userDataAgent.getClassesForAdmin().then((classesResponse) async {
      _dashboardClassesDao.saveAllDashboardClasses(classesResponse.classes);
    });
  }

  @override
  Future<List<StudentVO>?> getStudentsForAdmin() {
    return _userDataAgent.getStudents().then((value) => value.students);
  }

  @override
  Future<BaseResponse> createClass(
      {String? className,
      double? classFees,
      String? classInfo,
      String? startDate,
      String? endDate,
      List<int>? lectureIds}) {
    return _userDataAgent.createClass(
        className: className,
        classFees: classFees,
        classInfo: classInfo,
        startDate: startDate,
        endDate: endDate,
        lectureIds: lectureIds);
  }

  @override
  Future<List<LectureVO>?> getLectures() {
    return _userDataAgent.getLectures().then((value) => value.lectures);
  }

  @override
  void getClassDetail({required int classId}) {
    _userDataAgent.getClassDetail(classId: classId).then((value) {
      _dashboardClassesDao.saveSingleClass(value.classDetail);
    });
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
    return _userDataAgent.createLiveSession(
        startTime: startTime,
        endTime: endTime,
        date: date,
        meetUrl: meetUrl,
        lectureIds: lectureIds,
        classId: classId,
        liveTitle: liveTitle);
  }

  // From persistence

  @override
  Stream<List<ClassesVO>?> getDashboardClassesVoFromDatabase() {
    getClassesForDashboard();
    return _dashboardClassesDao
        .getAllDashboardClassesEventStream()
        .startWith(_dashboardClassesDao.getAllDashboardClassesStream())
        .map((event) => _dashboardClassesDao.getAllDashboardClassesList());
  }

  @override
  Stream<ClassesVO?> getClassDetailFromDatabase({required int classId}) {
    getClassDetail(classId: classId);
    return _dashboardClassesDao
        .getAllDashboardClassesEventStream()
        .startWith(_dashboardClassesDao.getClassDetailsStream(id: classId))
        .map((event) =>
            _dashboardClassesDao.getDashboardClassDetails(id: classId));
  }
}
