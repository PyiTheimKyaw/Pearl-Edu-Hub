import 'package:pearl_edu_hub/blocs/base_bloc.dart';

class DashboardPageBloc extends BaseBloc{
  int sidebarItemIndex = 0;
  bool isSideBarShown = true;

  void onTapMenu(){
    isSideBarShown = !isSideBarShown;
    notifySafely();
  }

  // Side  bar က တဆင့် ရွေးလိုက်တဲ့ page index ကို view layer ဘက်ကို notify လုပ်မယ့် call back
  void onChangePageIndex(int selectedIndex) {
    sidebarItemIndex = selectedIndex;
    notifySafely();
  }
}