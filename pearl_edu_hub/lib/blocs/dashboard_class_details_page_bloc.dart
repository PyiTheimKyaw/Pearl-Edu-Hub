import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/data/impls/user_data_model_impl.dart';
import 'package:pearl_edu_hub/data/models/user_data_model.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/live_session_vo.dart';
import 'package:pearl_edu_hub/dialogs/no_connection_dialog.dart';
import 'package:pearl_edu_hub/dialogs/prompt_dialog.dart';
import 'package:pearl_edu_hub/dialogs/success_dialog.dart';
import 'package:pearl_edu_hub/network/responses/errors_response.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/utils/error_handler.dart';
import 'package:pearl_edu_hub/widgets/loading_widget.dart';

class DashboardClassDetailsPageBloc extends BaseBloc {
  ClassesVO? classDetail;
  int tabIndex = 0;
  String? chosenStartDate;
  String? chosenStartTime;
  List<LiveSessionVO>? liveSessions;
  String? chosenEndTime;
  String? meetingLink;
  String? liveTitle;
  bool isVisibleLectureChoiceDialog = false;

  final UserDataModel _userDataModel = UserDataModelImpl();

  DashboardClassDetailsPageBloc(
      {required int classId, LiveSessionVO? selectedLive}) {
    setSuccessState();

    fetchAndGetClassDetail(id: classId, selectedLive: selectedLive);

  }

  void onChangedLiveTitle(String title) {
    liveTitle = title;
    notifySafely();
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

  Future createLiveSession() {
    Get.dialog(const LoadingWidget(
      color: Colors.transparent,
    ));
    return _userDataModel
        .createLiveSession(
            startTime: chosenStartTime,
            endTime: chosenEndTime,
            date: chosenStartDate,
            meetUrl: meetingLink,
            classId: classDetail?.id,
            liveTitle: liveTitle,
            lectureIds: getLectureIds())
        .then((value) async {
      await fetchAndGetClassDetail(id: classDetail?.id ?? 0);
      Get.back();
      Get.back();
      Get.dialog(SuccessDialog(
          dialogSubTitle: value.msg ?? "", dialogTitle: kTextSuccess));
    }).catchError((error) async {
      Get.back();
      switch (error.runtimeType) {
        case const (BadRequestException):
          Map<String, dynamic> jsonMap = await json.decode(error.toString());
          ErrorsResponse errorRes = ErrorsResponse.fromJson(jsonMap);
          setDialogSuccessState();
          Get.dialog(PromptDialog(
              message:
                  "${errorRes.errors?.date ?? ""} ${errorRes.errors?.startTime ?? ""} ${errorRes.errors?.endTime ?? ""} ${errorRes.errors?.lectureIds ?? ""} ${errorRes.errors?.meetUrl ?? ""}"));
        case const (DeadlineExceededException):
          Get.dialog(NoConnectionDialog(
            message: error.toString(),
          ));
        default:
          Get.dialog(PromptDialog(message: error.toString()));
      }
    });
  }

  Future<void> fetchAndGetClassDetail(
      {required int id, LiveSessionVO? selectedLive}) async {
    return _userDataModel
        .getClassDetailFromDatabase(classId: id)
        .listen((value) {
      classDetail = value;
      liveSessions = classDetail?.liveSessions;
      liveTitle = selectedLive?.liveTitle;
      chosenStartDate = selectedLive?.date;
      chosenStartTime = selectedLive?.startTime;
      chosenEndTime = selectedLive?.endTime;
      meetingLink = selectedLive?.meetUrl;
      if(selectedLive==null){
        classDetail?.lectures.map((e) {
          e.isSelected = false;
          notifySafely();
        }).toList();
      }
      List<String>? dummyIds = selectedLive?.lectureIds?.split(",").toList();
      print("Dummy Ids $dummyIds ${selectedLive}");
      if (dummyIds != null && dummyIds.isNotEmpty) {
        classDetail?.lectures.map((e) {
          if (dummyIds.contains(e.id.toString())) {
            e.isSelected = true;
            notifySafely();
          }else{
            e.isSelected = false;
            notifySafely();
          }
        }).toList();
      }
      notifySafely();
    }).onError((error) {});
  }
}
