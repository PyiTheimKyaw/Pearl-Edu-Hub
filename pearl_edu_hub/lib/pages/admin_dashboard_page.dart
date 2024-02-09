import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kMargin32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: kMargin16,
            runAlignment: WrapAlignment.start,
            runSpacing: kMargin16,
            children: [
              _InfoItemView(
                  iconData: Icons.class_outlined,
                  label: kTextTotalClasses,
                  totalCount: "10"),
              _InfoItemView(
                  iconData: Icons.class_outlined,
                  label: kTextTotalStudents,
                  totalCount: "10"),
              _InfoItemView(
                  iconData: Icons.class_outlined,
                  label: kTextTotalLectures,
                  totalCount: "10"),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItemView extends StatelessWidget {
  const _InfoItemView({
    super.key,
    required this.iconData,
    required this.label,
    required this.totalCount,
  });

  final IconData iconData;
  final String label;
  final String totalCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMargin16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius10),
          border: Border.all(color: kInvisibleColor),
          color: kLowOpacityWhiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 3),
              color: Colors.black.withOpacity(
                0.2,
              ),
              blurRadius: 2,
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData,color: kProgressColor,),
          const SizedBox(
            height: kMargin8,
          ),
          CustomizedTextView(
            textData: totalCount,
            textFontSize: kFont13,
            textFontWeight: FontWeight.w500,
            textColor: kLightPrimaryColor,
          ),
          const SizedBox(
            height: kMargin8,
          ),
          CustomizedTextView(
            textData: label,
            textFontSize: kFont18,
            textFontWeight: FontWeight.bold,
            textColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
