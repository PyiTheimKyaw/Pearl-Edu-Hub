import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class DashboardTransactionsPage extends StatelessWidget {
  const DashboardTransactionsPage({super.key, required this.onTapMenu});

  final Function onTapMenu;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
            left: kMargin32, right: kMargin32, bottom: kMargin24),
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
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomizedTextView(
                    textData: "ID",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    width: kMargin32,
                  ),
                  Expanded(
                    child: CustomizedTextView(
                      textData: "Date & Time",
                      textFontSize: kFont16,
                      textFontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Class",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "User Name",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Payment type",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Amount",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: CustomizedTextView(
                    textData: "Status",
                    textFontSize: kFont16,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                  horizontal: kMargin8, vertical: kMargin8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 40,
              itemBuilder: (context, index) => const _TransactionItemView(),
              separatorBuilder: (context, index) => const SizedBox(
                height: kMargin12,
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
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizedTextView(
            textData: "1",
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            width: kMargin32,
          ),
          Expanded(
              child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomizedTextView(
              textData: "Pyi Theim Kyaw",
              textFontSize: kFont16,
              textFontWeight: FontWeight.w500,
              textColor: kPrimaryColor,
              textDecoration: TextDecoration.underline,
              textAlign: TextAlign.center,
            ),
          )),
          Expanded(
              child: CustomizedTextView(
            textData: "2900000",
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: CustomizedTextView(
            textData: "2023-32,232",
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: CustomizedTextView(
            textData: "2023-32,232",
            textFontSize: kFont16,
            textFontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomizedTextView(
              textData: "80",
              textFontSize: kFont16,
              textFontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: kPrimaryColor,
              textDecoration: TextDecoration.underline,
            ),
          )),
          Expanded(
              child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomizedTextView(
              textData: "80",
              textFontSize: kFont16,
              textFontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: kPrimaryColor,
              textDecoration: TextDecoration.underline,
            ),
          )),
        ],
      ),
    );
  }
}
