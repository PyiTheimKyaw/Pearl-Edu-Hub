import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/blocs/dashboard_class_details_page_bloc.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/data/vos/enrollment_vo.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/data/vos/live_session_vo.dart';
import 'package:pearl_edu_hub/dialogs/lecture_selection_dialog.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/images.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/utils/strings_extension.dart';
import 'package:pearl_edu_hub/widgets/customized_text_field.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:pearl_edu_hub/widgets/date_picker_view.dart';
import 'package:pearl_edu_hub/widgets/empty_view_with_illustration_view.dart';
import 'package:pearl_edu_hub/widgets/image_from_servlet.dart';
import 'package:pearl_edu_hub/widgets/loading_state_widget.dart';
import 'package:pearl_edu_hub/widgets/primary_button.dart';
import 'package:pearl_edu_hub/widgets/rounded_image_view.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class DashboardClassDetailsPage extends StatelessWidget {
  const DashboardClassDetailsPage({super.key, required this.classId, required this.onTapBack});

  final String classId;
  final Function onTapBack;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DashboardClassDetailsPageBloc(classId: int.parse(classId)),
      child: Consumer<DashboardClassDetailsPageBloc>(
        builder: (BuildContext context, bloc, Widget? child) => LoadingStateWidget<DashboardClassDetailsPageBloc>(
          loadingState: bloc.getLoadingState,
          dialogLoadingState: bloc.getDialogLoadingState,
          widgetForSuccessState: SingleChildScrollView(
            child: (bloc.classDetail != null)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ClassInfoAndActionButtons(
                        classDetail: bloc.classDetail!,
                        onTapBack: onTapBack,
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      const _ClassDetailsInfoSectionView()
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class _ClassDetailsInfoSectionView extends StatefulWidget {
  const _ClassDetailsInfoSectionView();

  @override
  State<_ClassDetailsInfoSectionView> createState() => _ClassDetailsInfoSectionViewState();
}

class _ClassDetailsInfoSectionViewState extends State<_ClassDetailsInfoSectionView>
    with SingleTickerProviderStateMixin {
  List<String> tabLabelLists = [
    kTextEnrolledStudents,
    kTextEntranceQuestions,
    kTextAssignments,
    kTextPopQuizzes,
    kTextLiveSessions
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardClassDetailsPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: kClassDetailTabContainerHeight,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: kMargin32),
                    itemCount: tabLabelLists.length,
                    itemBuilder: (context, index) => _TabBarItemView(
                      tabLabel: tabLabelLists[index],
                      isSelected: bloc.tabIndex == index,
                      onChangedTab: () {
                        bloc.onChangeTabIndex(index);
                      },
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: kMargin8,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: kMargin24,
              ),
              Visibility(
                visible: bloc.tabIndex == 0,
                child: PrimaryButton(
                  buttonText: kTextAddNewStudent,
                  onTapButton: () async {
                    // FilePickerResult? result = await FilePicker.platform.pickFiles(
                    //   type: FileType.any,
                    // allowedExtensions: ['pdf'],
                    // );

                    // if (result != null) {
                    //   File file = File(result.files.single.path!);
                    // uploadImage();
                    // } else {
                    // User canceled the picker
                    // }
                  },
                  isDense: true,
                ),
              ),
              Visibility(
                visible: bloc.tabIndex == 1,
                child: PrimaryButton(
                  buttonText: kTextAddAssignment,
                  onTapButton: () {},
                  isDense: true,
                ),
              ),
              Visibility(
                visible: bloc.tabIndex == 2,
                child: PrimaryButton(
                  buttonText: kTextAddPopQuiz,
                  onTapButton: () {},
                  isDense: true,
                ),
              ),
              Visibility(
                visible: bloc.tabIndex == 3,
                child: PrimaryButton(
                  buttonText: kTextAddLiveSession,
                  onTapButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return _AddOrEditLiveSessionDialog(
                            classId: bloc.classDetail?.id ?? 0,
                          );
                        });
                  },
                  isDense: true,
                ),
              ),
              const SizedBox(
                width: kMargin32,
              ),
            ],
          ),
          const SizedBox(
            height: kMargin8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMargin32),
            child: [
              // Company Profile section view
              const _EnrolledStudentsSectionView(),
              const Text("Entrance ques"),

              // Job Description Section View
              const Text("Addign"),
              const Text("Stud"),
              // Job Description Section View
              _LiveListSectionView(
                classLectures: bloc.classDetail?.lectures,
              ),
            ][bloc.tabIndex],
          ),
          const SizedBox(
            height: kMargin48,
          ),
        ],
      ),
    );
  }
}

class _TabBarItemView extends StatelessWidget {
  const _TabBarItemView({
    required this.tabLabel,
    this.isSelected = false,
    required this.onChangedTab,
  });

  final String tabLabel;
  final bool? isSelected;
  final Function onChangedTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChangedTab();
      },
      child: Container(
        height: kClassDetailTabItemHeight,
        padding: const EdgeInsets.all(kMargin16),
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          color: (isSelected ?? false) ? kPrimaryColor : kUnselectedTabBarColor,
          shadows: const [BoxShadow(offset: Offset(1, 0.8), color: kLightBrownColor, blurRadius: 0.4)],
        ),
        child: CustomizedTextView(
          textData: tabLabel,
          textFontSize: kFont16,
          textFontWeight: (isSelected ?? false) ? FontWeight.w700 : FontWeight.w400,
          textColor: (isSelected ?? false) ? kWhiteColor : kBlackColor,
        ),
      ),
    );
  }
}

class _LiveListSectionView extends StatelessWidget {
  const _LiveListSectionView({required this.classLectures});

  final List<LectureVO>? classLectures;

  @override
  Widget build(BuildContext context) {
    return Selector<DashboardClassDetailsPageBloc, List<LiveSessionVO>?>(
      selector: (context, bloc) => bloc.liveSessions,
      shouldRebuild: (next, prev) => next != prev,
      builder: (BuildContext context, liveSessions, Widget? child) =>
          (liveSessions != null && (liveSessions.isNotEmpty))
              ? Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: kMargin16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: liveSessions.length,
                    itemBuilder: (context, index) => _LiveSessionItemView(
                      liveSession: liveSessions[index],
                      classLectures: classLectures,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: kMargin16,
                    ),
                  ),
                )
              : const Center(
                  child: Padding(
                  padding: EdgeInsets.symmetric(vertical: kMargin24),
                  child: EmptyViewWithIllustrationView(
                      emptyViewText: kTextNoLiveSessionText, emptyViewImage: kEmptyLiveSessionIllustration),
                )),
    );
  }
}

class _EnrolledStudentsSectionView extends StatelessWidget {
  const _EnrolledStudentsSectionView();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardClassDetailsPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => Container(
        decoration: BoxDecoration(color: kWhiteColor, border: Border.all(color: kInvisibleColor)),
        child: Column(
          children: [

            // Container(
            //   color: kPrimaryColor,
            //   padding: const EdgeInsets.all(kMargin16),
            //   child: const Row(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 1,
            //         child: CustomizedTextView(
            //           textData: kTextEnrollmentId,
            //           textFontSize: kFont16,
            //           textFontWeight: FontWeight.bold,
            //           textColor: kWhiteColor,
            //         ),
            //       ),
            //       Expanded(
            //           flex: 2,
            //           child: CustomizedTextView(
            //             textData: kTextSubmittedAt,
            //             textFontSize: kFont16,
            //             textFontWeight: FontWeight.bold,
            //             textAlign: TextAlign.center,
            //             textColor: kWhiteColor,
            //           )),
            //       Expanded(
            //           flex: 2,
            //           child: CustomizedTextView(
            //             textData: kTextStudentId,
            //             textFontSize: kFont16,
            //             textFontWeight: FontWeight.bold,
            //             textAlign: TextAlign.center,
            //             textColor: kWhiteColor,
            //           )),
            //       Expanded(
            //           flex: 3,
            //           child: CustomizedTextView(
            //             textData: kTextName,
            //             textFontSize: kFont16,
            //             textFontWeight: FontWeight.bold,
            //             textAlign: TextAlign.center,
            //             textColor: kWhiteColor,
            //           )),
            //       Expanded(
            //           flex: 2,
            //           child: CustomizedTextView(
            //             textData: kTextStatus,
            //             textFontSize: kFont16,
            //             textFontWeight: FontWeight.bold,
            //             textAlign: TextAlign.center,
            //             textColor: kWhiteColor,
            //           )),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: kMargin12,
            ),
            ListView.separated(
              padding: const EdgeInsets.all(kMargin16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bloc.classDetail?.enrollments?.length ?? 0,
              itemBuilder: (context, index) => _EnrolledStudentItemView(
                enrollment: bloc.classDetail?.enrollments?[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: kMargin16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LiveSessionItemView extends StatelessWidget {
  const _LiveSessionItemView({
    required this.liveSession,
    required this.classLectures,
  });

  final LiveSessionVO? liveSession;
  final List<LectureVO>? classLectures;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kMargin16, vertical: kMargin24),
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(color: kInvisibleColor.withOpacity(0.3)),
        // boxShadow: [
        //   BoxShadow(
        //     offset: const Offset(1, 3),
        //     color: Colors.black.withOpacity(
        //       0.2,
        //     ),
        //     blurRadius: 2,
        //   ),
        // ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomizedTextView(
              textData: "# ${liveSession?.id ?? 0} - ${liveSession?.liveTitle}",
              textFontSize: kFont16,
              textFontWeight: FontWeight.w600,
              textColor: kPrimaryColor,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...?liveSession?.getLecturesForLiveSession(classLectures)?.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: kMargin4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (kIsWeb)
                            ? const RoundedImageView(
                                imageData: NetworkImage(kUserPlaceHolderImage),
                                imageSize: kLectureRoundedImageSizeSmall,
                                isCircle: true,
                              )
                            : const RoundedImageView(
                                imageData: AssetImage(kUserPlaceHolderImage),
                                imageSize: kLectureRoundedImageSizeSmall,
                                isCircle: true,
                              ),
                        const SizedBox(
                          width: kMargin4,
                        ),
                        CustomizedTextView(
                          textData: e.name ?? kTextNA,
                          textFontSize: kFont16,
                          textFontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ))
            ],
          )),
          Expanded(
            child: CustomizedTextView(
              textData: liveSession?.date ?? "",
              textFontSize: kFont16,
              textFontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
              child: CustomizedTextView(
            textData: "${liveSession?.startTime.formattedTime()} - ${liveSession?.endTime.formattedTime()}",
            textFontSize: kFont16,
            textFontWeight: FontWeight.w600,
          )),
          Expanded(
            child: CustomizedTextView(
              textData: liveSession?.meetUrl ?? kTextNA,
              textFontSize: kFont16,
              textFontWeight: FontWeight.w600,
              textColor: kPrimaryColor,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrimaryButton(
                  buttonText: kTextUpdateLive,
                  isDense: true,
                  btnVerPadding: kMargin8,
                  btnHorPadding: kMargin8,
                  buttonTextSize: kFont13,
                  onTapButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return _AddOrEditLiveSessionDialog(
                            classId: liveSession?.classId ?? 0,
                            selectedLive: liveSession,
                            isUpdate: true,
                          );
                        });
                  }),
              const SizedBox(
                width: kMargin12,
              ),
              InkWell(
                onTap: () {
                  //   TODO: add action for delete live session
                },
                child: const Icon(
                  Icons.delete,
                  color: kRedColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EnrolledStudentItemView extends StatelessWidget {
  const _EnrolledStudentItemView({
    required this.enrollment,
  });

  final EnrollmentVO? enrollment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kMargin4, vertical: kMargin8),
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(color: kInvisibleColor),
        borderRadius: BorderRadius.circular(kRadius10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 3),
            color: Colors.black.withOpacity(
              0.2,
            ),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                //   TODO: navigate to enrollment detail
              },
              child: CustomizedTextView(
                textData: "# ${enrollment?.id ?? 0}",
                textFontSize: kFont16,
                textFontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: CustomizedTextView(
                textData: enrollment?.createdAt ?? "",
                textFontSize: kFont16,
                textFontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 2,
              child: CustomizedTextView(
                textData: "# ${enrollment?.student?.id ?? 0}",
                textFontSize: kFont16,
                textFontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  //   TODO: student detail action
                },
                child: CustomizedTextView(
                  textData: enrollment?.student?.name ?? "",
                  textFontSize: kFont16,
                  textColor: kPrimaryColor,
                  textFontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(
            flex: 2,
            child: CustomizedTextView(
              textData: "${enrollment?.amount ?? 0}",
              textFontSize: kFont16,
              textFontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassInfoAndActionButtons extends StatelessWidget {
  const _ClassInfoAndActionButtons({required this.classDetail, required this.onTapBack});

  final ClassesVO classDetail;
  final Function onTapBack;

  Future<void> uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      List<int> bytes = result.files.single.bytes!;
      var url = 'http://localhost:8082/pearlEduHubApi/upload'; // Replace with your servlet URL

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(
        http.MultipartFile.fromBytes('image', bytes, filename: 'image.jpg'),
      );
      request.fields['file_name'] = 'abc.jpg';

      var response = await request.send();
      if (response.statusCode == 200) {
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              onTapBack();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(
            width: kMargin16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomizedTextView(
                textData: "Class Name: ${classDetail.className ?? ""}",
                textColor: kPrimaryColor,
                textFontWeight: FontWeight.bold,
                textFontSize: kFont20,
              ),
              const SizedBox(
                height: kMargin12,
              ),
              CustomizedTextView(
                textData: "Start Date: ${classDetail.startDate ?? " "}",
                textFontWeight: FontWeight.w600,
                textFontSize: kFont16,
              ),
              const SizedBox(
                height: kMargin12,
              ),
              CustomizedTextView(
                textData: "End Date: ${classDetail.endDate ?? " "}",
                textFontWeight: FontWeight.w600,
                textFontSize: kFont16,
              ),
              const SizedBox(
                height: kMargin12,
              ),
              CustomizedTextView(
                textData: "Class Fees: ${(classDetail.fees ?? 0).toString().formattedCurrency()}",
                textFontWeight: FontWeight.w600,
                textFontSize: kFont16,
              ),
              const SizedBox(
                height: kMargin12,
              ),
              CustomizedTextView(
                textData: "Lectures: ${classDetail.lectures.map((e) => e.name ?? "").toList().join(",")}",
                textFontWeight: FontWeight.w600,
                textFontSize: kFont16,
              ),
            ],
          ),
          const Spacer(),
          const ImageFromServlet(),
          // Consumer<DashboardClassDetailsPageBloc>(
          //     builder: (BuildContext context, bloc, Widget? child) => Image.memory(bloc.imageData ?? Uint8List(0))),
          const Spacer(),
          Selector<DashboardClassDetailsPageBloc, int>(
            selector: (BuildContext context, bloc) => bloc.tabIndex,
            builder: (BuildContext context, tabIndex, Widget? child) => Column(
              children: [
                PrimaryButton(
                  buttonText: kTextEditClass,
                  onTapButton: () {},
                  isDense: true,
                ),
                const SizedBox(
                  height: kMargin12,
                ),
                Visibility(
                  visible: tabIndex == 0,
                  child: PrimaryButton(
                    buttonText: kTextAddNewStudent,
                    onTapButton: () async {
                      // FilePickerResult? result = await FilePicker.platform.pickFiles(
                      //   type: FileType.any,
                      // allowedExtensions: ['pdf'],
                      // );

                      // if (result != null) {
                      //   File file = File(result.files.single.path!);
                      uploadImage();
                      // } else {
                      // User canceled the picker
                      // }
                    },
                    isDense: true,
                  ),
                ),
                Visibility(
                  visible: tabIndex == 1,
                  child: PrimaryButton(
                    buttonText: kTextAddAssignment,
                    onTapButton: () {},
                    isDense: true,
                  ),
                ),
                Visibility(
                  visible: tabIndex == 2,
                  child: PrimaryButton(
                    buttonText: kTextAddPopQuiz,
                    onTapButton: () {},
                    isDense: true,
                  ),
                ),
                Visibility(
                  visible: tabIndex == 3,
                  child: PrimaryButton(
                    buttonText: kTextAddLiveSession,
                    onTapButton: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return _AddOrEditLiveSessionDialog(
                              classId: classDetail.id ?? 0,
                            );
                          });
                    },
                    isDense: true,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AddOrEditLiveSessionDialog extends StatelessWidget {
  const _AddOrEditLiveSessionDialog({required this.classId, this.selectedLive, this.isUpdate});

  final int classId;
  final LiveSessionVO? selectedLive;
  final bool? isUpdate;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DashboardClassDetailsPageBloc(classId: classId, selectedLive: selectedLive),
      child: Consumer<DashboardClassDetailsPageBloc>(
        builder: (BuildContext context, bloc, Widget? child) => Stack(
          children: [
            Dialog(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius10)),
              backgroundColor: kWhiteColor,
              insetPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: kMargin16, horizontal: kMargin24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomizedTextField(
                        inputValue: bloc.liveTitle,
                        labelText: kTextLiveTitle,
                        prefixIcon: const Icon(
                          Icons.live_tv,
                          color: kPrimaryColor,
                        ),
                        inputBorder: const OutlineInputBorder(borderSide: BorderSide(color: kLightBrownColor)),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: kLightBrownColor)),
                        onChangeValue: (value) {
                          bloc.onChangedLiveTitle(value);
                        },
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      DatePickerView(
                        onChooseDOB: (date) {
                          bloc.onChooseStartDate(date: date);
                        },
                        hintText: "Date",
                        chosenDate: bloc.chosenStartDate,
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      DatePickerView(
                        onChooseDOB: (date) {
                          bloc.onChooseStartTime(time: date);
                        },
                        hintText: "Start Time",
                        chosenDate: bloc.chosenStartTime,
                        isTime: true,
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      DatePickerView(
                        onChooseDOB: (date) {
                          bloc.onChooseEndTime(time: date);
                        },
                        hintText: "End Time",
                        chosenDate: bloc.chosenEndTime,
                        isTime: true,
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      CustomizedTextField(
                        inputValue:
                            "Selected ${bloc.classDetail?.lectures.where((element) => element.isSelected ?? false).length}",
                        labelText: "Lectures",
                        prefixIcon: const Icon(
                          Icons.group,
                          color: kPrimaryColor,
                        ),
                        inputBorder: const OutlineInputBorder(borderSide: BorderSide(color: kLightBrownColor)),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: kLightBrownColor)),
                        onTapTextField: () {
                          bloc.onTapChoiceOfLecture(visible: true);
                        },
                        onChangeValue: (val) {},
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      CustomizedTextField(
                        inputValue: bloc.meetingLink,
                        labelText: kTextMeetingLink,
                        prefixIcon: const Icon(
                          Icons.meeting_room_outlined,
                          color: kPrimaryColor,
                        ),
                        inputBorder: const OutlineInputBorder(borderSide: BorderSide(color: kLightBrownColor)),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: kLightBrownColor)),
                        onChangeValue: (value) {
                          bloc.onChangedMeetingLink(value);
                        },
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      PrimaryButton(
                          buttonText: (isUpdate ?? false) ? kTextUpdate : kTextCreate,
                          isDense: true,
                          onTapButton: () {
                            if (!(isUpdate ?? false)) {
                              bloc.createLiveSession();
                            } else {}
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: bloc.isVisibleLectureChoiceDialog,
              child: LecturesSelectionDialog(
                lecturesList: bloc.classDetail?.lectures,
                onChooseFunctionalArea: (id, checked) {
                  bloc.onChooseLecture(id, checked);
                },
                onTapDone: () {
                  bloc.onTapChoiceOfLecture(visible: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
