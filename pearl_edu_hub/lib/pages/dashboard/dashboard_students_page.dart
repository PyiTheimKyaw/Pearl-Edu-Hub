import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/blocs/admin_students_page_bloc.dart';
import 'package:pearl_edu_hub/data/vos/student_vo.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';

class DashboardStudentsPage extends StatelessWidget {
  const DashboardStudentsPage({super.key,required this.onTapMenu});
  final Function onTapMenu;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AdminStudentsPageBloc(),
      child: Container(
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
                      child: CustomizedTextView(
                    textData: "ID",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                    flex: 2,
                    child: CustomizedTextView(
                      textData: "Name",
                      textFontSize: kFont16,
                      textFontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Phone",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Email",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Address",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Current Class",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
            Selector<AdminStudentsPageBloc, List<StudentVO>?>(
              selector: (BuildContext context, bloc) => bloc.students,
              builder: (BuildContext context, students, Widget? child) =>
                  ListView.separated(
                padding: const EdgeInsets.symmetric(
                    horizontal: kMargin8, vertical: kMargin8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: students?.length ?? 0,
                itemBuilder: (context, index) => _StudentItemView(
                  student: students?[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: kMargin12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StudentItemView extends StatelessWidget {
  const _StudentItemView({required this.student});

  final StudentVO? student;

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
              child: CustomizedTextView(
            textData: (student?.id ?? 0).toString(),
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          )),
          Expanded(
              flex: 2,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CustomizedTextView(
                  textData: student?.name ?? "",
                  textFontSize: kFont16,
                  textFontWeight: FontWeight.w500,
                  textColor: kPrimaryColor,
                  textDecoration: TextDecoration.underline,
                ),
              )),
          Expanded(
              child: CustomizedTextView(
            textData: student?.phNum ?? '',
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: CustomizedTextView(
            textData: student?.email ?? "",
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: CustomizedTextView(
            textData: student?.address ?? "",
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
