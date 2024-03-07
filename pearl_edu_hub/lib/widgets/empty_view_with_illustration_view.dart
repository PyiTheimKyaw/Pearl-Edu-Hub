import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class EmptyViewWithIllustrationView extends StatelessWidget {
  const EmptyViewWithIllustrationView(
      {super.key, required this.emptyViewText, required this.emptyViewImage});

  final String emptyViewText;
  final String emptyViewImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(emptyViewImage),
        const SizedBox(height: kMargin16,),
        CustomizedTextView(
          textData: emptyViewText,
          textFontSize: kFont24,
          textFontWeight: FontWeight.bold,
          textColor: kProgressColor,
        ),
      ],
    );
  }
}
