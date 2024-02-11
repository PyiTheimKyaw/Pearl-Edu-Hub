
import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_page.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/images.dart';
import 'package:pearl_edu_hub/responsive/responsive.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';

class DashboardAppBarView extends StatelessWidget {
  const DashboardAppBarView({super.key, required this.onTapMenu,required this.appBarLabel});
  final Function onTapMenu;
  final String appBarLabel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMargin32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {
                  onTapMenu();
                },
                child: const Icon(
                  Icons.menu,
                  color: kDashboardBgColor,
                ),
              )),
          const SizedBox(
            width: kMargin16,
          ),
          CustomizedTextView(
            textData: appBarLabel,
            textFontSize: kFont20,
            textFontWeight: FontWeight.w600,
          ),
          Spacer(),
          CircleAvatar(
            child: Image.asset(
              kAppLogoWithColor,
              width: kAppLogoSize,
              height: kAppLogoSize,
            ),
          ),
          const SizedBox(
            width: kMargin12,
          ),
          const CustomizedTextView(
            textData: "PTK",
            textFontSize: kFont20,
            textFontWeight: FontWeight.w600,
          ),
          const SizedBox(
            width: kMargin16,
          ),
          GestureDetector(
            onTap: () {
              //   TODO:
            },
            child: const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(
                Icons.logout,
                color: kRedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}