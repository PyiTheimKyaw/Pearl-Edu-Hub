import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';
import 'package:pearl_edu_hub/network/data_agents/user_data_agent.dart';
import 'package:pearl_edu_hub/network/impls/retrofit_user_data_agent_impl.dart';

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
}
