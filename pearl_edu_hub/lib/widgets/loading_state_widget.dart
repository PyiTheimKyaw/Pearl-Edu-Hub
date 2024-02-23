/*

ဒီ widget သည် network or json က data တွေက်ို fetch တဲ့အခါ fetching status က loading / error/ success ပေါ်မူတည်ပြီး
widget တွေ switch ပြီးပြပေးန်ုင်မယ့် reusable widget ဖြစ်ပါတယ်။

Fetching process တွေနဲ့ သုံးရတဲ့ screen တိုင်းမှာ ဒီ widget က်ို အသုံးပြုသင့်ပါသညါ

 */
import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/utils/enums.dart';
import 'package:pearl_edu_hub/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class LoadingStateWidget<T extends BaseBloc> extends StatelessWidget {
  const LoadingStateWidget(
      {super.key,
        required this.loadingState,
        this.dialogLoadingState = LoadingState.success,
        this.widgetForLoadingState,
        this.loadingDialogColor,
        required this.widgetForSuccessState});

  final Widget? widgetForLoadingState;
  final Widget widgetForSuccessState;
  final LoadingState loadingState;
  final Color? loadingDialogColor;
  final LoadingState? dialogLoadingState;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<T>();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (loadingState == LoadingState.error) {
    //     showDialog(
    //         barrierDismissible: false,
    //         context: context,
    //         builder: (_) => bloc.getErrorType == "DeadlineExceededException"
    //             ? NoConnectionDialog(
    //           message: bloc.getErrorMessage,
    //         )
    //             : PromptDialog(message: bloc.getErrorMessage));
    //   }
    // });
    return switch (loadingState) {
      LoadingState.loading => widgetForLoadingState ?? const LoadingWidget(),
      _ => Stack(
        children: [
          widgetForSuccessState,
          Visibility(
              visible: dialogLoadingState == LoadingState.loading,
              child: LoadingWidget(
                color: loadingDialogColor ?? Colors.transparent,
              ))
        ],
      ),
    };
  }
}
