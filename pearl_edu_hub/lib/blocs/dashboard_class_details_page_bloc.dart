import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';

class DashboardClassDetailsPageBloc extends BaseBloc {
  ClassesVO? classDetail;
  int tabIndex = 0;
  String? chosenStartDate;
  String? chosenStartTime;

  String? chosenEndTime;
  String? meetingLink;
  bool isVisibleLectureChoiceDialog = false;

  final UserDataModel _userDataModel = UserDataModel();

  DashboardClassDetailsPageBloc({required int classId}) {
    setSuccessState();
    fetchAndGetClassDetail(id: classId);
  }

  void onChangedMeetingLink(String link) {
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

  void onChooseStartTime({String? time}) {
    chosenStartTime = time;
    notifySafely();
  }

  void onChooseEndTime({String? time}) {
    chosenEndTime = time;
    notifySafely();
  }

  void onChangeTabIndex(int index) {
    tabIndex = index;
    notifySafely();
  }

  List<int> getLectureIds() {
    List<int> ids = [];
    classDetail?.lectures.map((e) {
      if (e.isSelected ?? false) {
        ids.add(e.id ?? 0);
      }
    }).toList();
    notifySafely();
    return ids;
  }

  Future<BaseResponse> createLiveSession() {
    setDialogLoadingState();
    return _userDataModel.createLiveSession(startTime: chosenStartTime,
        endTime: chosenEndTime,
        date: chosenStartDate,
        meetUrl: meetingLink,
        classId: classDetail?.id,
        lectureIds: getLectureIds());
  }

  Future<ClassesVO?> fetchAndGetClassDetail({required int id}) {
    return _userDataModel.getClassDetail(classId: id).then((value) {
      classDetail = value;
      print("Class detail ${classDetail?.id}");
      notifySafely();
    }).catchError((error) {});
  }
}
