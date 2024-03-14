import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/images.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/responsive/responsive.dart';
import 'package:pearl_edu_hub/utils/strings_extension.dart';
import 'package:pearl_edu_hub/widgets/customized_text_field.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:pearl_edu_hub/widgets/primary_button.dart';

class DashboardLecturesPage extends StatelessWidget {
  const DashboardLecturesPage({super.key, required this.onTapMenu});

  final Function onTapMenu;

  @override
  Widget build(BuildContext context) {
    print(
        "Screen size is desktop ${MediaQuery.of(context).size.height} ${MediaQuery.of(context).size.width}"
        " ${Responsive.isDesktopFromMediaQuery(context)} , mobile : ${Responsive.isMobileFromMediaQuery(context)}");
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kMargin32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchAndAddLectureButtonSectionView(),
            SizedBox(
              height: kMargin24,
            ),
            _LectureListSectionView(),
          ],
        ),
      ),
    );
  }
}

class _LectureListSectionView extends StatelessWidget {
  const _LectureListSectionView();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isDesktopFromMediaQuery(context)
            ? 3
            : Responsive.isMobileFromMediaQuery(context)
                ? 1
                : 2,
        crossAxisSpacing: kMargin8,
        mainAxisSpacing: kMargin8,
        childAspectRatio: Responsive.isDesktopFromMediaQuery(context) ? 4 / 3 : 1.4,
      ),
      itemBuilder: (context, index) => const _LectureItemView(),
    );
  }
}

class _LectureItemView extends StatelessWidget {
  const _LectureItemView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kMargin16, vertical: kMargin24),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(kRadius10),
        border: Border.all(color: kInvisibleColor.withOpacity(0.5)),
        boxShadow: const [
          BoxShadow(
            color: kInvisibleColor,
            blurRadius: 1,
            offset: Offset(1, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizedTextView(
            textData: "${kTextId.toUpperCase()}: $kDummyTextID",
            textFontSize: kFont13,
            textFontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: kMargin8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: Responsive.isDesktopFromMediaQuery(context) ? 0.9 : 1,
                  child: const Image(
                    image: AssetImage(
                      kDummyPersonImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: kMargin4,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomizedTextView(
                      textData: kDummyTextAccName,
                      textFontSize: kFont13,
                      textColor: kPrimaryColor,
                      textFontWeight: FontWeight.w700,
                      textDecoration: TextDecoration.underline,
                    ),
                    SizedBox(
                      height: kMargin8,
                    ),
                    CustomizedTextView(
                      textData: kDummyTextPhNum.formatPhoneNumber(),
                      textFontWeight: FontWeight.w600,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchAndAddLectureButtonSectionView extends StatelessWidget {
  const _SearchAndAddLectureButtonSectionView();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: CustomizedTextField(
              onChangeValue: (value) {},
              hintText: kTextSearch,
              isFilled: true,
              filledColor: kWhiteColor,
              inputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kRadius25),
                  borderSide: const BorderSide(color: kWhiteColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kRadius25),
                  borderSide: const BorderSide(color: kWhiteColor)),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: kInvisibleColor,
              ),
              suffixIcon: const Icon(
                Icons.close,
                color: kInvisibleColor,
              ),
            )),
        const Spacer(),
        PrimaryButton(
          buttonText: kTextAddNewLecture,
          onTapButton: () {},
          isDense: true,
        )
      ],
    );
  }
}
