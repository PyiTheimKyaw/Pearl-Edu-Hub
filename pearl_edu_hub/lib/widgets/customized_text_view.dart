import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/fonts.dart';
import 'package:pearl_edu_hub/responsive/responsive.dart';

class CustomizedTextView extends StatelessWidget {
  const CustomizedTextView({
    super.key,
    required this.textData,
    this.textColor = kBlackColor,
    this.textFontSize = kFont13,
    this.textFontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.textOverflow = TextOverflow.visible,
    this.allInOneStyle,
    this.textDecoration,
    this.fontStyle,
  });

  final String textData;
  final Color? textColor;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextStyle? allInOneStyle;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  @override
  Widget build(BuildContext context) {

    double? getFontSizeOnMultiDimensions() {
        if (Responsive.isTabletFromMediaQuery(context)) {
          switch (textFontSize) {
            case kFont13:
              return kFont16;
            case kFont14:
              return kFont18;
            case kFont16:
              return kFont22;
            case kFont18:
              return kFont22;
            case kFont20:
              return kFont24;
            case kFont24:
              return kFont30;

            default:
              textFontSize;
          }
        }
        return textFontSize;
    }

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black, fontFamily: kFontTWK),
      child: Text(
        textData,
        style: allInOneStyle ??
            TextStyle(
                color: textColor,
                fontSize: textFontSize,
                fontWeight: textFontWeight,
                fontFamily: kFontTWK,
                fontStyle: fontStyle,
                height: 1.2,
                decoration: textDecoration),
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
// textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
      ),
    );
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
