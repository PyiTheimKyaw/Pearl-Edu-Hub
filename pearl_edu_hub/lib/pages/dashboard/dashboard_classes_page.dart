import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pearl_edu_hub/blocs/admin_classes_page_bloc.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/dialogs/lecture_selection_dialog.dart';
import 'package:pearl_edu_hub/dialogs/success_dialog.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_class_details_page.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/route/app_bar_route.dart';
import 'package:pearl_edu_hub/widgets/customized_text_field.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:pearl_edu_hub/widgets/date_picker_view.dart';
import 'package:provider/provider.dart';

class DashboardClassesPage extends StatelessWidget {
  const DashboardClassesPage({super.key, required this.onChangeAppBarTitle,required this.isInitPage});

  final Function(String?) onChangeAppBarTitle;
  final bool isInitPage;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AdminClassesPageBloc(),
      child: Consumer<AdminClassesPageBloc>(
        builder: (BuildContext context, bloc, Widget? child) {
          if (bloc.selectedClass != null && !isInitPage) {
            return DashboardClassDetailsPage(
              classId: (bloc.selectedClass?.id ?? 0).toString(),
              onTapBack: () {
                bloc.onTapPopFromClassDetail();
                onChangeAppBarTitle(null);
              },
            );
          }
          return _ClassesSectionView(
            onChangeAppBarTitle: onChangeAppBarTitle,
          );
        },
      ),
    );
  }
}

class _ClassesSectionView extends StatelessWidget {
  const _ClassesSectionView({required this.onChangeAppBarTitle});

  final Function(String?) onChangeAppBarTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const _CreateClassButtonView(),
        Container(
          margin: const EdgeInsets.only(
              left: kMargin32, right: kMargin32, bottom: kMargin24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius10),
              border: Border.all(color: kInvisibleColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(kMargin16),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(219, 226, 236, 1.0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kRadius10),
                      topRight: Radius.circular(kRadius10)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomizedTextView(
                        textData: "ID-Title",
                        textFontSize: kFont16,
                        textFontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                        child: CustomizedTextView(
                      textData: "Price",
                      textFontSize: kFont16,
                      textFontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: CustomizedTextView(
                      textData: "Start Date",
                      textFontSize: kFont16,
                      textFontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: CustomizedTextView(
                      textData: "End Date",
                      textFontSize: kFont16,
                      textFontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: CustomizedTextView(
                      textData: "Enrollments",
                      textFontSize: kFont16,
                      textFontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
              Selector<AdminClassesPageBloc, List<ClassesVO>?>(
                selector: (BuildContext context, bloc) => bloc.classes,
                builder: (BuildContext context, classes, Widget? child) =>
                    ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kMargin8, vertical: kMargin8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: classes?.length ?? 0,
                  itemBuilder: (context, index) => _ClassItemView(
                    classItem: classes?[index],
                    onTapClassItem: (classItem) {
                      var bloc = Provider.of<AdminClassesPageBloc>(context,
                          listen: false);
                      bloc.onChooseClass(chosenClass: classItem);
                      onChangeAppBarTitle(
                          "${AppBarRoute.getClassDetail}${classItem.className}");
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: kMargin12,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _CreateClassButtonView extends StatelessWidget {
  const _CreateClassButtonView();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminClassesPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => Padding(
        padding: const EdgeInsets.only(right: kMargin32, bottom: kMargin24),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed)) {
                  return kProgressColor;
                }
                return kPrimaryColor;
              }),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _CreateClassDialogView(
                      onCompleteCreateClass: () {
                        bloc.getClassesForAdminClassesPage();
                      },
                    );
                  });
            },
            child: const Padding(
              padding: EdgeInsets.all(kMargin8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  CustomizedTextView(
                    textData: kTextCreateClass,
                    textColor: kWhiteColor,
                    textFontWeight: FontWeight.bold,
                    textFontSize: kFont16,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class _CreateClassDialogView extends StatelessWidget {
  const _CreateClassDialogView({required this.onCompleteCreateClass});

  final Function onCompleteCreateClass;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AdminClassesPageBloc(),
      child: Consumer<AdminClassesPageBloc>(
        builder: (BuildContext context, bloc, Widget? child) => Stack(
          children: [
            Dialog(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kRadius10)),
              backgroundColor: kWhiteColor,
              insetPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kMargin16, horizontal: kMargin24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomizedTextView(
                        textData: kTextCreateClass,
                        textFontWeight: FontWeight.bold,
                        textFontSize: kFont16,
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      CustomizedTextField(
                        inputValue: bloc.className,
                        labelText: "Class Name",
                        prefixIcon: const Icon(
                          Icons.class_outlined,
                          color: kPrimaryColor,
                        ),
                        inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        onChangeValue: (value) {
                          bloc.onChangedClassName(name: value);
                        },
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      CustomizedTextField(
                        inputValue: bloc.classFees,
                        labelText: "Fees",
                        textInputType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          color: kPrimaryColor,
                        ),
                        inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        onChangeValue: (value) {
                          bloc.onChangedClassFees(fees: value);
                        },
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      // _HtmlEditorView(),
                      CustomizedTextField(
                        inputValue: bloc.classInfo,
                        labelText: "Class Information",
                        maxLines: 5,
                        prefixIcon: const Icon(
                          Icons.info_outline,
                          color: kPrimaryColor,
                        ),
                        inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        onChangeValue: (value) {
                          bloc.onChangedClassInfo(info: value);
                        },
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      CustomizedTextField(
                        inputValue:
                            "Selected ${bloc.lectures?.where((element) => element.isSelected ?? false).length}",
                        labelText: "Lectures",
                        prefixIcon: const Icon(
                          Icons.group,
                          color: kPrimaryColor,
                        ),
                        inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBrownColor)),
                        onTapTextField: () {
                          bloc.onTapChoiceOfLecture(visible: true);
                        },
                        onChangeValue: (val) {},
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      DatePickerView(
                        onChooseDOB: (date) {
                          bloc.onChooseStartDate(date: date);
                        },
                        hintText: "Start Date",
                        chosenDate: bloc.chosenStartDate,
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      DatePickerView(
                        onChooseDOB: (date) {
                          bloc.onChooseEndDate(date: date);
                        },
                        hintText: "End Date",
                        chosenDate: bloc.chosenEndDate,
                      ),
                      const SizedBox(
                        height: kMargin24,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return green, otherwise blue
                                if (states.contains(MaterialState.pressed)) {
                                  return kProgressColor;
                                }
                                return kPrimaryColor;
                              }),
                            ),
                            onPressed: () {
                              bloc.onTapCreateClass().then((value) {
                                onCompleteCreateClass();
                                Get.back();
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SuccessDialog(
                                          dialogSubTitle: value.msg ?? "",
                                          dialogTitle: value.status ?? "");
                                    });
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: kMargin8),
                              child: CustomizedTextView(
                                textData: kTextCreateClass,
                                textColor: kWhiteColor,
                                textFontWeight: FontWeight.bold,
                                textFontSize: kFont16,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: bloc.isVisibleLectureChoiceDialog,
              child: LecturesSelectionDialog(
                lecturesList: bloc.lectures,
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

class _ClassItemView extends StatelessWidget {
  const _ClassItemView({required this.classItem, required this.onTapClassItem});

  final ClassesVO? classItem;
  final Function(ClassesVO) onTapClassItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: kMargin4, vertical: kMargin16),
      decoration: BoxDecoration(border: Border.all(color: kInvisibleColor)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  if (classItem != null) {
                    onTapClassItem(classItem!);
                  }
                },
                child: CustomizedTextView(
                  textData: "#${classItem?.id}-${classItem?.className}",
                  textFontSize: kFont16,
                  textFontWeight: FontWeight.w500,
                  textColor: kPrimaryColor,
                  textDecoration: TextDecoration.underline,
                ),
              )),
          Expanded(
              child: CustomizedTextView(
            textData: (classItem?.fees ?? 0).toString(),
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: CustomizedTextView(
            textData: classItem?.startDate ?? '',
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: CustomizedTextView(
            textData: classItem?.endDate ?? '',
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          const Expanded(
              child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomizedTextView(
              textData: "80",
              textFontSize: kFont16,
              textFontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: kPrimaryColor,
              textDecoration: TextDecoration.underline,
            ),
          )),
        ],
      ),
    );
  }
}

class _HtmlEditorView extends StatelessWidget {
  const _HtmlEditorView();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminClassesPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => HtmlEditor(
        controller: bloc.controller,
        htmlEditorOptions: HtmlEditorOptions(
          initialText: bloc.classInfo,
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          customToolbarButtons: [Container()],
          defaultToolbarButtons: [
            const StyleButtons(),
            const FontSettingButtons(fontSizeUnit: false),
            const FontButtons(
                clearAll: false, superscript: false, subscript: false),
            const ListButtons(listStyles: false),
            const ParagraphButtons(
                textDirection: false, lineHeight: false, caseConverter: false),
            const InsertButtons(
                picture: false,
                video: false,
                audio: false,
                table: false,
                hr: false,
                otherFile: false)
          ],
          toolbarPosition: ToolbarPosition.aboveEditor,
          //by default
          toolbarType: ToolbarType.nativeGrid,
          //by default
          onButtonPressed:
              (ButtonType type, bool? status, Function? updateStatus) {
            return true;
          },
          onDropdownChanged: (DropdownType type, dynamic changed,
              Function(dynamic)? updateSelectedItem) {
            return true;
          },
          mediaLinkInsertInterceptor: (String url, InsertFileType type) {
            return true;
          },
        ),
        otherOptions: OtherOptions(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: kLightBrownColor),
          ),
        ),
        callbacks: Callbacks(
            onBeforeCommand: (String? currentHtml) {},
            onChangeContent: (String? changed) {
              bloc.onChangedSummary(changed);
            },
            onChangeCodeview: (String? changed) {},
            onChangeSelection: (EditorSettings settings) {},
            onDialogShown: () {},
            onEnter: () {},
            onFocus: () {},
            onBlur: () {},
            onBlurCodeview: () {},
            onInit: () {},
            onKeyDown: (int? keyCode) {},
            onKeyUp: (int? keyCode) {},
            onMouseDown: () {},
            onMouseUp: () {},
            onNavigationRequestMobile: (String url) {
              return NavigationActionPolicy.ALLOW;
            },
            onPaste: () {},
            onScroll: () {}),
        plugins: [
          SummernoteAtMention(
              getSuggestionsMobile: (String value) {
                var mentions = <String>['test1', 'test2', 'test3'];
                return mentions
                    .where((element) => element.contains(value))
                    .toList();
              },
              mentionsWeb: ['test1', 'test2', 'test3'],
              onSelect: (String value) {}),
        ],
      ),
    );
  }
}
