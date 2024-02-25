import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pearl_edu_hub/blocs/base_bloc.dart';
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
            lectureIds: getLectureIds())
        .then((value) async{
      Get.back();
      Get.back();
      await fetchAndGetClassDetail(id: classDetail?.id ?? 0)
          .then((val) {

        Get.dialog(SuccessDialog(
            dialogSubTitle: value.msg ?? "", dialogTitle: kTextSuccess));
      });
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

  Future<ClassesVO?> fetchAndGetClassDetail({required int id}) {
    return _userDataModel.getClassDetail(classId: id).then((value) {
      classDetail = value;
      liveSessions = classDetail?.liveSessions;
      print("Live session length ${liveSessions?.length}");
      notifySafely();
    }).catchError((error) {
      print("Class detail error ${error.toString()}");
    });
  }
}
