import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';

class DashboardClassDetailsPageBloc extends BaseBloc {
  ClassesVO? classDetail;
  final UserDataModel _userDataModel = UserDataModel();

  DashboardClassDetailsPageBloc({required int classId}) {
    fetchAndGetClassDetail(id: classId);
  }

  Future<ClassesVO?> fetchAndGetClassDetail({required int id}) {
    return _userDataModel.getClassDetail(classId: id).then((value) {
      classDetail = value;
      print("Class detail ${classDetail?.id}");
      notifySafely();
    }).catchError((error){

    });
  }
}
