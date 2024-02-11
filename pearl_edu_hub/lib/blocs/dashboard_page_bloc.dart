import 'package:pearl_edu_hub/blocs/base_bloc.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/route/route_constants.dart';

class DashboardPageBloc extends BaseBloc {
  int sidebarItemIndex = 0;
  bool isSideBarShown = true;
  String path = '';
  List<String> titleList = [
    kTextDashboard,
    kTextClasses,
    kTextStudents,
    kTextLectures,
    kTextAssignments,
    kTextPopQuizzes,
    kTextTransactions,
    kTextPaymentType
  ];

  void getPath(final pat) {
    path = pat;
    notifySafely();
  }

  void onTapMenu() {
    isSideBarShown = !isSideBarShown;
    notifySafely();
  }

  // Side  bar က တဆင့် ရွေးလိုက်တဲ့ page index ကို view layer ဘက်ကို notify လုပ်မယ့် call back
  void onChangePageIndex(int selectedIndex) {
    sidebarItemIndex = selectedIndex;
    if (path.contains(RouteConstants.getDashboard)) {
      sidebarItemIndex = 0;
    } else if (path.contains(RouteConstants.getClasses)) {
      sidebarItemIndex = 1;
    } else if (path.contains(RouteConstants.getStudents)) {
      sidebarItemIndex = 2;
    } else if (path.contains(RouteConstants.getLectures)) {
      sidebarItemIndex = 3;
    } else if (path.contains(RouteConstants.getAssignments)) {
      sidebarItemIndex = 4;
    } else if (path.contains(RouteConstants.getQuizzes)) {
      sidebarItemIndex = 5;
    } else if (path.contains(RouteConstants.getTransactions)) {
      sidebarItemIndex = 6;
    } else if (path.contains(RouteConstants.getPaymentTypes)) {
      sidebarItemIndex = 7;
    }
    print("Selected item index $sidebarItemIndex $path");
    notifySafely();
  }
}
