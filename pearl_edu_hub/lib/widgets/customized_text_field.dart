import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/fonts.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';


class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.isPhone = false,
    this.textInputType,
    this.inputBorder,
    this.isFilled = false,
    this.filledColor,
    this.suffixIcon,
    this.prefixIcon,
    this.inputValue,
    required this.onChangeValue,
    this.maxLines,
    this.isReadOnly = false,
    this.onTapTextField,
    this.onFieldSubmitted,
    this.focusedBorder,
    this.inputFormatters
  });

  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final bool isPhone;
  final TextInputType? textInputType;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final bool? isFilled;
  final Color? filledColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? inputValue;
  final Function(String) onChangeValue;
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  final bool? isReadOnly;
  final Function? onTapTextField;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      readOnly: isReadOnly ?? false,
      maxLines: maxLines ?? 1,
      autocorrect: false,
      controller: TextEditingController(text: inputValue)
        ..selection = TextSelection.collapsed(
          offset: inputValue?.length ?? 0,
        ),
      style: const TextStyle(
        fontFamily: kFontTWK,
        fontSize: kFont16,
        fontWeight: FontWeight.w400,
      ),
      inputFormatters: inputFormatters,
      keyboardType: isPhone ? TextInputType.number : textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            fontSize: kFont13,
            color: kInvisibleColor,
            fontWeight: FontWeight.w400),
        floatingLabelStyle: const TextStyle(
            fontSize: kFont16,
            color: kPrimaryColor,
            fontWeight: FontWeight.w400),
        filled: isFilled,
        fillColor: (isFilled ?? false) ? filledColor : null,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: kFont13,
            color: kInvisibleColor,
            fontWeight: FontWeight.w400),
        suffixIcon: suffixIcon,
        prefixIcon: (isPhone)
            ? const Padding(
          padding: EdgeInsets.all(kMargin8),
          child: CustomizedTextView(
            textData: "Ph- ",
            textFontSize: kFont13,
          ),
        )
            : prefixIcon,
        prefixIconConstraints:
        const BoxConstraints(minHeight: 20, minWidth: 40),
        enabledBorder: inputBorder,
        focusedBorder: focusedBorder,
        isDense: true,
      ),
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!(value);
        }
      },
      onChanged: (value) {
        onChangeValue(value);
      },
      onTap: () {
        if (onTapTextField != null) {
          onTapTextField!();
        }
      },
    );
  }
}
