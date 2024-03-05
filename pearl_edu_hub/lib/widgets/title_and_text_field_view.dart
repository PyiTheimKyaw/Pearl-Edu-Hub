import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_field.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class TitleAndTextFieldView extends StatelessWidget {
  const TitleAndTextFieldView({
    super.key,
    required this.title,
    this.onChooseItem,
    this.suffixIcon,
    this.dropDownList,
    this.onChangeTextValue,
    this.inputTextValue,
    this.hinTextField,
    this.textFiledInputBorder,
    this.titleFontSize = kFont13,
    this.titleColor = kPrimaryColor,
    this.titleFontWeight = FontWeight.w400,
    this.spaceBetweenTitleAndText = kMargin4,
    this.isPhone = false,
    this.dropDownHint,
    this.selectedDropDownItem,
    this.maxLines,
    this.errorMessage,
    this.prefixIcon,
    this.textInputType,
    this.onTapTextField,
    this.isReadOnly = false,
    this.onFieldSubmitted,
  });

  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<dynamic>? dropDownList;
  final Function(String)? onChangeTextValue;
  final Function(String)? onFieldSubmitted;
  final String? inputTextValue;
  final String? hinTextField;
  final InputBorder? textFiledInputBorder;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Color titleColor;
  final double spaceBetweenTitleAndText;
  final bool isPhone;
  final Function(dynamic)? onChooseItem;
  final String? dropDownHint;
  final dynamic selectedDropDownItem;
  final int? maxLines;
  final String? errorMessage;
  final TextInputType? textInputType;
  final Function? onTapTextField;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title view
        CustomizedTextView(
          textData: title,
          textFontSize: titleFontSize,
          textFontWeight: titleFontWeight,
          textColor: titleColor,
        ),
        SizedBox(
          height: spaceBetweenTitleAndText,
        ),
        // Text field view
        CustomizedTextField(
          inputBorder: textFiledInputBorder,
          inputValue: inputTextValue,
          hintText: hinTextField ?? '',
          maxLines: maxLines,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          isPhone: isPhone,
          textInputType: textInputType,
          onTapTextField: onTapTextField,
          isReadOnly: isReadOnly,
          onFieldSubmitted: onFieldSubmitted,
          onChangeValue: (value) {
            if (onChangeTextValue != null) {
              onChangeTextValue!(value);
            }
          },
        ),

        // Visibility(
        //   visible: !errorMessage.isEmptyOrNull(),
        //   child: CustomizedTextView(
        //     textData: errorMessage ?? kTextNA,
        //     textColor: kRedColor,
        //     textFontSize: kFont13,
        //   ),
        // )
      ],
    );
  }
}
