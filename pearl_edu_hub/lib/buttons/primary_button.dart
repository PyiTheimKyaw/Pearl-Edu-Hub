import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.borderRadius = kRadius10,
    required this.buttonText,
    this.btnFontWeight = FontWeight.w600,
    this.btnTextColor = kWhiteColor,
    this.btnTextSize,
    required this.onTapButton,
    this.btnPadding = kMargin16,
    this.btnWidth,
    this.isGhostButton,
    this.ghostButtonColor,
    this.isDense = false,
    this.borderColor,
    this.btnIcon,
    this.btnIconColor,
    this.btnHorPadding,
    this.btnVerPadding,
    this.btnTextAlign = TextAlign.center,
  });

  final double borderRadius;
  final String buttonText;
  final Color? btnTextColor;
  final double? btnTextSize;
  final FontWeight? btnFontWeight;
  final Function onTapButton;
  final double btnPadding;
  final double? btnWidth;
  final bool? isGhostButton;
  final Color? ghostButtonColor;
  final bool? isDense;
  final Color? borderColor;
  final IconData? btnIcon;
  final Color? btnIconColor;
  final double? btnHorPadding;
  final double? btnVerPadding;
  final TextAlign? btnTextAlign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapButton();
      },
      child: Container(
        width: (isDense ?? false)
            ? null
            : btnWidth ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color:
                (isGhostButton ?? false) ? ghostButtonColor : kDashboardBgColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: (isGhostButton ?? false)
                ? Border.all(
                    color: ghostButtonColor ?? borderColor ?? kBlackColor)
                : null),
        padding: btnHorPadding == null
            ? EdgeInsets.all(btnPadding)
            : EdgeInsets.symmetric(
                horizontal: btnHorPadding ?? 0, vertical: btnVerPadding ?? 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: btnIcon != null,
              child: Icon(
                btnIcon,
                color: btnIconColor,
              ),
            ),
            Visibility(
              visible: btnIcon != null,
              child: const SizedBox(
                width: kMargin8,
              ),
            ),
            Flexible(
              child: CustomizedTextView(
                textData: buttonText,
                textColor: btnTextColor,
                textFontWeight: btnFontWeight,
                textFontSize: btnTextSize,
                textAlign: btnTextAlign,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
