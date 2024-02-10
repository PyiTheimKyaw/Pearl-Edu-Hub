import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';

class AdminDashboardPageBloc extends BaseBloc{
  int? totalClasses;
  int? totalStudents;

  final UserDataModel _userDataModel = UserDataModel();

  AdminDashboardPageBloc() {
    fetchData();
  }

  void fetchData() {
    _userDataModel.getClassesForAdmin().then((value) {
      totalClasses = value?.length ?? 0;
      notifySafely();
    });
    _userDataModel.getStudentsForAdmin().then((value) {
      totalStudents = value?.length ?? 0;
      notifySafely();
    });
  }
}