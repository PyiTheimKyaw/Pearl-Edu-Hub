//User က action တခုခု ကို နှိပ်လိုက်လို့ ဖြစ်လာတဲ့ error or alert message ကို button တခုထဲ နဲ့ Prompt dialog ပုံစံ မျိူး အတွက် create လုပ်ထားတာ ဖြစ်ပါတယ်
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:pearl_edu_hub/widgets/primary_button.dart';

class PromptDialog extends StatelessWidget {
  const PromptDialog({super.key, this.message});

  //App ရဲ့ language ပေါ်မူတည်ပြီး ပြပေးမယ့် message text
  final String? message;

  //Dialog မှာ ပြမယ့် message က customized လုပ်ထားတဲ့ richtext

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius30)),
      insetPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.12),
      child: Container(
        padding: const EdgeInsets.all(kMargin16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius10),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              color: kTrendingColor,
              size: 70.0,
            ),
            //Dialog ရဲ့ alert info message
            const SizedBox(
              height: kMargin16,
            ),
            //Dialog ရဲ့ alert info message
            CustomizedTextView(
              textData: message ?? "",
              textFontSize: kFont13,
              textAlign: TextAlign.center,
              textFontWeight: FontWeight.w900,
              textColor: kTrendingColor,
            ),
            const SizedBox(
              height: kMargin16,
            ),
            //Ok text button provided by app's current language
            PrimaryButton(
              isDense: true,
              buttonText: kTextClose,
              buttonTextSize: kFont16,
              btnHorPadding: kMargin24,
              btnVerPadding: kMargin16,
              onTapButton: () {
                //OK button ကို နှိပ်လိုက်ပြီ ဆိုရုင် dialog ကို ပိတ်ဖို့ function ကို ခေါ်ပါတယ်
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
