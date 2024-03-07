import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pearl_edu_hub/buttons/primary_button.dart';
import 'package:pearl_edu_hub/dialogs/delete_confirmation_dialog.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/images.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/responsive/responsive.dart';
import 'package:pearl_edu_hub/widgets/customized_text_field.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:pearl_edu_hub/widgets/rounded_image_view.dart';

class DashboardPaymentTypesPage extends StatelessWidget {
  const DashboardPaymentTypesPage({super.key, required this.onTapMenu});

  final Function onTapMenu;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kMargin32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PrimaryButton(
                buttonText: kTextCreateNewPaymentType,
                borderRadius: kRadius30,
                btnIcon: Icons.add,
                btnIconColor: kPrimaryColor,
                isDense: true,
                onTapButton: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          const _CreateOrEditPaymentTypeDialog());
                }),
            const SizedBox(
              height: kMargin16,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: kMargin24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius10),
                  border: Border.all(color: kInvisibleColor)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(kMargin16),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(219, 226, 236, 1.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kRadius10),
                          topRight: Radius.circular(kRadius10)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomizedTextView(
                          textData: kTextId.toUpperCase(),
                          textFontSize: kFont16,
                          textFontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          width: kMargin32,
                        ),
                        const Expanded(
                          child: CustomizedTextView(
                            textData: kTextName,
                            textFontSize: kFont16,
                            textFontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                            child: CustomizedTextView(
                          textData: kTextImage,
                          textFontSize: kFont16,
                          textFontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        )),
                        const Expanded(
                            child: CustomizedTextView(
                          textData: kTextAccName,
                          textFontSize: kFont16,
                          textFontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        )),
                        const Expanded(
                          child: CustomizedTextView(
                            textData: kTextAccNum,
                            textFontSize: kFont16,
                            textFontWeight: FontWeight.w600,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMargin8, vertical: kMargin8),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 40,
                    itemBuilder: (context, index) =>
                        const _TransactionItemView(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: kMargin12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateOrEditPaymentTypeDialog extends StatelessWidget {
  const _CreateOrEditPaymentTypeDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius10)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kMargin24, vertical: kMargin32),
        color: kWhiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomizedTextView(
              textData: kTextPaymentInfo,
              textColor: kPrimaryColor,
              textFontSize: kFont24,
              textFontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: kMargin24,
            ),
            CustomizedTextField(
              inputValue: "bloc.className",
              labelText: kTextPaymentName,
              prefixIcon: const Icon(
                Icons.payment,
                color: kPrimaryColor,
              ),
              inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kLightBrownColor)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kLightBrownColor)),
              onChangeValue: (value) {
                // bloc.onChangedClassName(name: value);
              },
            ),
            const SizedBox(
              height: kMargin24,
            ),
            const CustomizedTextView(
              textData: kTextImage,
              textFontSize: kFont16,
              textFontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: kMargin16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                  horizontal: kMargin24, vertical: kMargin32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius15),
                  border: Border.all(color: kLightDarkColor),
                  color: kWhiteColor),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomizedTextView(
                    textData: kTextDragAndDropFile,
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: kMargin8,
                  ),
                  PrimaryButton(
                    buttonText: kTextBrowseNow,
                    btnTextSize: kFont13,
                    borderRadius: kRadius30,
                    onTapButton: () {},
                    isGhostButton: true,
                    isDense: true,
                    ghostButtonColor: kPrimaryColor,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: kMargin24,
            ),
            CustomizedTextField(
              inputValue: "bloc.className",
              labelText: kTextAccName,
              prefixIcon: const Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
              inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kLightBrownColor)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kLightBrownColor)),
              onChangeValue: (value) {
                // bloc.onChangedClassName(name: value);
              },
            ),
            const SizedBox(
              height: kMargin24,
            ),
            CustomizedTextField(
              inputValue: "bloc.className",
              labelText: kTextAccNum,
              prefixIcon: const Icon(
                Icons.numbers,
                color: kPrimaryColor,
              ),
              inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kLightBrownColor)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kLightBrownColor)),
              onChangeValue: (value) {
                // bloc.onChangedClassName(name: value);
              },
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
                  Visibility(
                    visible: Responsive.isDesktopFromMediaQuery(context),
                    child: const Expanded(flex: 2, child: SizedBox.shrink()),
                  ),
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
                        buttonText: kTextCreateNewPaymentType,
                        isDense: true,
                        btnTextAlign: TextAlign.center,
                        onTapButton: () {}),
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

class _TransactionItemView extends StatelessWidget {
  const _TransactionItemView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: kMargin4, vertical: kMargin16),
      decoration: BoxDecoration(border: Border.all(color: kInvisibleColor)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomizedTextView(
            textData: "#$kDummyTextID",
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            width: kMargin32,
          ),
          const Expanded(
              child: CustomizedTextView(
            textData: kDummyTextPaymentName,
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textColor: kPrimaryColor,
            textDecoration: TextDecoration.underline,
            textAlign: TextAlign.center,
          )),
          const Expanded(
            child: RoundedImageView(
              imageData: AssetImage(kDummyKPayImage),
              imageSize: kPaymentTypeImageSize,
              boxFit: BoxFit.contain,
              borderRadius: kRadius10,
            ),
          ),
          const Expanded(
              child: CustomizedTextView(
            textData: kDummyTextAccName,
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          // Visibility(
          //   visible: Responsive.isMobileFromMediaQuery(context),
          //   replacement: Expanded(
          //     child: Wrap(
          //       alignment: WrapAlignment.start,
          //       crossAxisAlignment: WrapCrossAlignment.start,
          //       // mainAxisSize: MainAxisSize.min,
          //       // crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const CustomizedTextView(
          //           textData: kDummyTextAccNum,
          //           textFontSize: kFont16,
          //           textFontWeight: FontWeight.w500,
          //           textAlign: TextAlign.start,
          //         ),
          //         const SizedBox(
          //           width: kMargin16,
          //         ),
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(Icons.edit),
          //           color: kPrimaryColor,
          //         ),
          //         const SizedBox(
          //           width: kMargin8,
          //         ),
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(Icons.delete),
          //           color: kRedColor,
          //         ),
          //       ],
          //     ),
          //   ),
          //   child: const Expanded(
          //       child: CustomizedTextView(
          //     textData: kDummyTextAccNum,
          //     textFontSize: kFont16,
          //     textFontWeight: FontWeight.w500,
          //     textAlign: TextAlign.start,
          //   )),
          // ),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomizedTextView(
                  textData: kDummyTextAccNum,
                  textFontSize: kFont16,
                  textFontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  width: kMargin16,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: kMargin8,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                        context: context,
                        builder: (context) => DeleteConfirmationDialog(
                            confirmationItemTitle: kTextPaymentType,
                            onTapDelete: () {}));
                  },
                  icon: const Icon(Icons.delete),
                  color: kRedColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
