import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
        this.borderRadius = kRadius10,
        required this.buttonText,
        this.buttonFontWeight = FontWeight.w600,
        this.buttonTextColor = kWhiteColor,
        this.buttonTextSize,
        required this.onTapButton,
        this.buttonPadding = kMargin18,
        this.buttonWidth,
        this.isGhostButton,
        this.ghostButtonColor,
        this.isDense = false,
        this.borderColor,
        this.buttonIcon,
        this.buttonIconColor,
        this.btnHorPadding,
        this.btnVerPadding});

  final double borderRadius;
  final String buttonText;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final FontWeight? buttonFontWeight;
  final Function onTapButton;
  final double buttonPadding;
  final double? buttonWidth;
  final bool? isGhostButton;
  final Color? ghostButtonColor;
  final bool? isDense;
  final Color? borderColor;
  final IconData? buttonIcon;
  final Color? buttonIconColor;
  final double? btnHorPadding;
  final double? btnVerPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapButton();
      },
      child: Container(
        width: (isDense ?? false) ? null : buttonWidth ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: (isGhostButton ?? false) ? ghostButtonColor : kDashboardBgColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: (isGhostButton ?? false)
                ? Border.all(color: ghostButtonColor ?? borderColor ?? kBlackColor)
                : null),
        padding: btnHorPadding == null
            ? EdgeInsets.all(buttonPadding)
            : EdgeInsets.symmetric(horizontal: btnHorPadding ?? 0, vertical: btnVerPadding ?? 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: buttonIcon != null,
              child: Icon(
                buttonIcon,
                color: buttonIconColor,
              ),
            ),
            Visibility(
              visible: buttonIcon != null,
              child: const SizedBox(
                width: kMargin8,
              ),
            ),
            Flexible(
              child: CustomizedTextView(
                textData: buttonText,
                textColor: buttonTextColor,
                textFontWeight: buttonFontWeight,
                textFontSize: buttonTextSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
