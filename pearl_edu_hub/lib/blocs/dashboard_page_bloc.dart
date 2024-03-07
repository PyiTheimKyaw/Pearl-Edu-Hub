import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';

class DashboardPageBloc extends BaseBloc {
  int sidebarItemIndex = 0;
  bool isSideBarShown = true;
  String path = '';
  String? appBarRoute;

  List<String> titleList = [
    kTextDashboard,
    kTextClasses,
    kTextStudents,
    kTextLectures,
    kTextAssignments,
    kTextPopQuizzes,
    kTextTransactions,
    kTextPaymentTypes
  ];

  void getPath(final pat) {
    path = pat;
    notifySafely();
  }

  void onChangeAppBarRoute({String? route}) {
    appBarRoute = route;
    notifySafely();
  }

  void onTapMenu() {
    isSideBarShown = !isSideBarShown;
    notifySafely();
  }

  // Side  bar က တဆင့် ရွေးလိုက်တဲ့ page index ကို view layer ဘက်ကို notify လုပ်မယ့် call back
  void onChangePageIndex(int selectedIndex) {
    sidebarItemIndex = selectedIndex;
    appBarRoute = null;
    notifySafely();
  }
}
