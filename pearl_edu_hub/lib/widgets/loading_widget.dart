import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/images.dart';

/*

ဒီ widget ကတော့ LoadingProcess ဖြစ်နေတဲ့အချိန်မှာ render ပေးမယ့် reusable widget ဖြစ်ပါတယ်။
ဒီ widget သည် loading ဖြစ်နေတဲ့အချိန်မှာပြဖို့အတွက်အသုံးပြုသင့်ပါသညါ

 */
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color:  color ?? kWhiteColor,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(kLoadingGitWithColor,width: 200,height: 200,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
