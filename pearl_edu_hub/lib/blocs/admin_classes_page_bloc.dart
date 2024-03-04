// import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/impls/user_data_model_impl.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/network/responses/base_response.dart';

class AdminClassesPageBloc extends BaseBloc {
  List<ClassesVO>? classes;
  String? className;
  String? classFees;
  String? classInfo;
  String? chosenStartDate;
  String? chosenEndDate;
  List<LectureVO>? lectures;
  ClassesVO? selectedClass;
  bool isVisibleLectureChoiceDialog = false;
  // final HtmlEditorController controller = HtmlEditorController();

  final UserDataModel userDataModel = UserDataModelImpl();

  AdminClassesPageBloc() {
    selectedClass = null;
    getClassesForAdminClassesPage();
    getLectures();
  }

  void onChooseClass({required ClassesVO chosenClass}) {
    selectedClass = chosenClass;
    notifySafely();
  }

  void onTapPopFromClassDetail() {
    selectedClass = null;
    notifySafely();
  }

  void onChooseLecture(int id, bool isSelected) {
    lectures?.map((e) {
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

  Future<BaseResponse> onTapCreateClass() {
    return userDataModel.createClass(
        className: className,
        classFees: double.tryParse(classFees ?? ")0"),
        classInfo: classInfo,
        startDate: chosenStartDate,
        endDate: chosenEndDate,
        lectureIds: getLectureIds().toList());
  }

  List<int> getLectureIds() {
    List<int> ids = [];
    lectures?.map((e) {
      if (e.isSelected ?? false) {
        ids.add(e.id ?? 0);
      }
    }).toList();
    notifySafely();
    return ids;
  }

  void onChangedSummary(String? summary) {
    classInfo = summary;
    notifySafely();
  }

  void onChangedClassName({String? name}) {
    className = name;
    notifySafely();
  }

  void onChangedClassFees({String? fees}) {
    classFees = fees;
    notifySafely();
  }

  void onChangedClassInfo({String? info}) {
    classInfo = info;
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

  Future<List<LectureVO>?> getLectures() {
    return userDataModel.getLectures().then((value) {
      lectures = value;

      notifySafely();
    }).catchError((error) {});
  }

  Future getClassesForAdminClassesPage() async {
    return userDataModel.getDashboardClassesVoFromDatabase().listen((value) {
      classes = value;
      notifySafely();
    }).onError((error) {});
  }
}
