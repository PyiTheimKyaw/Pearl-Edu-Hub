import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:pearl_edu_hub/widgets/primary_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.dialogSubTitle,
    required this.dialogTitle,
  });

  final String dialogTitle;
  final String dialogSubTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius30)),
      insetPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.12),
      child: Container(
        padding: const EdgeInsets.all(kMargin24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius10),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 60,
              color: Colors.green,
            ),
            const SizedBox(
              height: kMargin24,
            ),
            CustomizedTextView(
              textData: dialogTitle,
              textFontSize: kFont20,
              textFontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: kMargin16,
            ),
            CustomizedTextView(
              textData: dialogSubTitle,
              textFontSize: kFont16,
              textFontWeight: FontWeight.w400,
              textColor: kLightBrownColor,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kMargin24,
            ),
            PrimaryButton(
                buttonText: kTextClose,
                isDense: true,
                buttonTextSize: kFont16,
                borderRadius: kRadius30,
                buttonWidth: MediaQuery.of(context).size.width/3,
                buttonPadding: kMargin12,
                onTapButton: () {
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}
