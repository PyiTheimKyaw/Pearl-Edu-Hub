import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';

class DashboardClassDetailsPageBloc extends BaseBloc {
  ClassesVO? classDetail;
  int tabIndex = 0;
  String? chosenStartDate;
  String? chosenEndDate;
  String? meetingLink;
  bool isVisibleLectureChoiceDialog = false;

  final UserDataModel _userDataModel = UserDataModel();

  DashboardClassDetailsPageBloc({required int classId}) {
    fetchAndGetClassDetail(id: classId);
  }

  void onChangedMeetingLink(String link){
    meetingLink = link;
    notifySafely();
  }

  void onChooseLecture(int id, bool isSelected) {
    classDetail?.lectures.map((e) {
      if (e.id == id) {
        e.isSelected = isSelected;
        notifySafely();
      }
    }).toList();
    notifySafely();
  }

  void onTapChoiceOfLecture({required bool visible}) {
    isVisibleLectureChoiceDialog = visible;
    notifySafely();
  }

  void onChooseStartDate({String? date}) {
    chosenStartDate = date;
    notifySafely();
  }

  void onChooseEndDate({String? date}) {
    chosenEndDate = date;
    notifySafely();
  }

  void onChangeTabIndex(int index) {
    tabIndex = index;
    notifySafely();
  }

  Future<ClassesVO?> fetchAndGetClassDetail({required int id}) {
    return _userDataModel.getClassDetail(classId: id).then((value) {
      classDetail = value;
      print("Class detail ${classDetail?.id}");
      notifySafely();
    }).catchError((error) {});
  }
}
