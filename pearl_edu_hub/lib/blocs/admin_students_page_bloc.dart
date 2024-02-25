import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/impls/user_data_model_impl.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';

class AdminStudentsPageBloc extends BaseBloc {
  List<StudentVO>? students;
  final UserDataModel _userDataModel = UserDataModelImpl();

  AdminStudentsPageBloc() {
    getStudents();
  }

  Future<List<StudentVO>?> getStudents() {
    return _userDataModel.getStudentsForAdmin().then((value) {
      students = value;
      notifySafely();
    }).catchError((error) {});
  }
}
