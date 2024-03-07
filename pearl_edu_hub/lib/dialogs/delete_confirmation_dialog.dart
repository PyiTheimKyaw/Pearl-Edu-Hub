import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pearl_edu_hub/buttons/primary_button.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/responsive/responsive.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    super.key,
    required this.confirmationItemTitle,
    required this.onTapDelete,
  });

  final String confirmationItemTitle;
  final Function onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhiteColor,
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width *
            (Responsive.isDesktopFromMediaQuery(context) ? 0.4 : 0.25),
      ),
      // vertical: MediaQuery.of(context).size.height * 0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius10)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kMargin24, vertical: kMargin32),
        color: kWhiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline_rounded,
              size: kInfoAlertIconSize,
              color: kRedColor,
            ),
            const SizedBox(
              height: kMargin24,
            ),
            CustomizedTextView(
              textData:
                  "$kTextDeleteConfirmationAlert ${confirmationItemTitle.toLowerCase()} ?",
              textColor: kWarningAlertColor,
              textFontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              textFontSize: kFont16 ,
            ),
            const SizedBox(
              height: kMargin24,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PrimaryButton(
                        buttonText: kTextCancel,
                        isDense: true,
                        isGhostButton: true,
                        ghostButtonColor: kLightDensePrimaryColor,
                        onTapButton: () {
                          Get.back();
                        }),
                  ),
                  const SizedBox(
                    width: kMargin20,
                  ),
                  Expanded(
                    child: PrimaryButton(
                        buttonText: kTextDelete,
                        isDense: true,
                        btnTextAlign: TextAlign.center,
                        onTapButton: () {
                          onTapDelete();
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
