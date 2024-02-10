import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/blocs/admin_classes_page_bloc.dart';
import 'package:pearl_edu_hub/data/vos/classes_vo.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';

class DashboardClassesPage extends StatelessWidget {
  const DashboardClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AdminClassesPageBloc(),
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

class _ClassItemView extends StatelessWidget {
  const _ClassItemView({required this.classItem});

  final ClassesVO? classItem;

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
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
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
          Expanded(
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
