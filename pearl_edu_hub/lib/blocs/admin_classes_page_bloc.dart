import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';

class AdminClassesPageBloc extends BaseBloc {
  List<ClassesVO>? classes;

  final UserDataModel userDataModel = UserDataModel();

  AdminClassesPageBloc() {
    getClassesForAdminClassesPage();
  }

  Future<List<ClassesVO>?> getClassesForAdminClassesPage() {
    return userDataModel.getClassesForAdmin().then((value) {
      classes = value;
      print("Classes list ${classes?.length}");

      notifySafely();
    }).catchError((error) {
      print("Error is ${error.toString()}");
    });
  }
}
