import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/data/vos/lecture_vo.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class LecturesSelectionDialog extends StatelessWidget {
  const LecturesSelectionDialog({
    super.key,
    this.lecturesList,
    required this.onChooseFunctionalArea,
    required this.onTapDone,
  });

  final List<LectureVO>? lecturesList;
  final Function(int, bool) onChooseFunctionalArea;
  final Function onTapDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent.withOpacity(0.5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius30)),
          insetPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius10),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMargin24, vertical: kMargin16),
                    child: GestureDetector(
                        onTap: () {
                          onTapDone();
                        },
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: CustomizedTextView(
                            textData: kTextDone,
                            textFontSize: kFont20,
                            textColor: kPrimaryColor,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMargin16, vertical: kMargin16),
                    itemCount: lecturesList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        value: lecturesList?[index].isSelected ?? false,
                        title: CustomizedTextView(
                          textData: lecturesList?[index].name ?? '',
                          textFontSize: kFont16,
                          textFontWeight: FontWeight.w600,
                        ),
                        controlAffinity: ListTileControlAffinity.platform,
                        onChanged: (checked) {
                          onChooseFunctionalArea(
                              lecturesList?[index].id ?? 0, checked ?? false);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
