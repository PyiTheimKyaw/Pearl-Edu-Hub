import 'package:flutter/foundation.dart';
import 'package:pearl_edu_hub/utils/enums.dart';

class BaseBloc extends ChangeNotifier {
  // Page က memory ပေါ်မှာ ရှိမရှိ notify လုပ်မယ့် status
  bool isDisposed = false;

  // api call ခေါ်တာ ဖြစ် ဖြစ် action တခုခု လုပ်တဲ့ အချ်န် မှာ loading ပြ ဖို့ loading state ကို enum set up လုပ်ထားပြီး သုံးထားပါတယ်
  LoadingState _loadingState = LoadingState.loading;
  LoadingState _dialogLoading = LoadingState.success;

  // api call ခေါ်တာ ဖြစ် ဖြစ် action တခုခု လုပ်တဲ့ အချ်န် မှာ fail ခဲ့ရင် ပြဖို့ error message
  String? _errorMessage;
  String? _errorType;

  // view layer(UI) တွေက နေ ပြန်သုံးဖို့ loading state တွေကို ယူမယ့် get method
  LoadingState get getLoadingState => _loadingState;

  LoadingState get getDialogLoadingState => _dialogLoading;

  // Error message ပြဖို့ ခေါ်မယ့် method
  String? get getErrorMessage => _errorMessage;
  String? get getErrorType => _errorType;

  // State တစ်ခု ကနေ တစ်ခု change ရင် သုံးဖို့ set method တွေဖြစ်ပါတယ်
  void setLoadingState() {
    _loadingState = LoadingState.loading;
    notifySafely();
  }

  void setSuccessState() {
    _loadingState = LoadingState.success;
    notifySafely();
  }

  void setDialogLoadingState() {
    _dialogLoading = LoadingState.loading;
    notifySafely();
  }

  void setDialogSuccessState() {
    _dialogLoading = LoadingState.success;
    notifySafely();
  }

  void setErrorState({required String? errorMsg,String? errorType}) {
    _loadingState = LoadingState.error;
    _errorType = errorType;
    _errorMessage = errorMsg;
    notifySafely();
  }

  void setErrorMessage({String? errorMsg}) {
    _errorMessage = errorMsg;
    notifySafely();
  }

  // screen ပေါ်မှာ ရှိနေတဲ့ အခါမှာ ဘဲ notify လုပ်မယ့် call back
  void notifySafely() {
    if (!isDisposed) {
      super.notifyListeners();
    }
  }

  //သက်ဆိုင်တဲ့ Page က Screen ပေါ်မှာ မရှိတော့ ရင် memory ကနေ dispose လုပ်မယ့် call back
  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
