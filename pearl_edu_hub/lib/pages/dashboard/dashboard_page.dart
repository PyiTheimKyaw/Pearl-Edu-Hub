import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/blocs/dashboard_page_bloc.dart';
import 'package:pearl_edu_hub/pages/dashboard/admin_dashboard_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_assignments_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_classes_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_lectures_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_payment_types_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_pop_quizzes_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_students_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_transactions_page.dart';
import 'package:pearl_edu_hub/rescources/colors.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';
import 'package:pearl_edu_hub/rescources/images.dart';
import 'package:pearl_edu_hub/rescources/strings.dart';
import 'package:pearl_edu_hub/responsive/responsive.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DashboardPageBloc(),
      child: Scaffold(
        backgroundColor: kLowOpacityWhiteColor,
        key: scaffoldKey,
        drawerEnableOpenDragGesture: false,
        drawer: const _SideBarSectionView(),
        body: Selector<DashboardPageBloc, int>(
          selector: (context, bloc) => bloc.sidebarItemIndex,
          shouldRebuild: (next, prev) => next != prev,
          builder: (BuildContext context, sidebarItemIndex, Widget? child) =>
              Responsive(
                  mobile: Expanded(
                    child: _ContentsSectionView(
                      sidebarItemIndex: sidebarItemIndex,
                    ),
                  ),
                  desktop: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<DashboardPageBloc>(
                        builder: (BuildContext context, bloc, Widget? child) =>
                            AnimatedSize(
                                duration: const Duration(milliseconds: 500),
                                child: bloc.isSideBarShown
                                    ? const Expanded(
                                        child: _SideBarSectionView())
                                    : const SizedBox(
                                        width: 100,
                                        child: _SideBarSectionView(
                                          isMinimizeSideBar: true,
                                        ),
                                      )),
                      ),
                      Expanded(
                        flex: 4,
                        child: _ContentsSectionView(
                          sidebarItemIndex: sidebarItemIndex,
                        ),
                      ),
                    ],
                  )),
        ),
      ),
    );
  }
}

class _ContentsSectionView extends StatelessWidget {
  const _ContentsSectionView({
    required this.sidebarItemIndex,
  });

  final int sidebarItemIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DashboardAppBarView(),
            SizedBox(
              child: [
                AdminDashboardPage(
                  onTapInfoItem: (index) {
                    var bloc =
                        Provider.of<DashboardPageBloc>(context, listen: false);
                    bloc.onChangePageIndex(index);
                  },
                ),
                const DashboardClassesPage(),
                const DashboardStudentsPage(),
                const DashboardLecturesPage(),
                const DashboardAssignmentsPage(),
                const DashboardPopQuizzesPage(),
                const DashboardTransactionsPage(),
                const DashboardPaymentTypesPage(),
              ][sidebarItemIndex],
            ),
          ],
        ),
      ),
    );
  }
}

class _SideBarSectionView extends StatelessWidget {
  const _SideBarSectionView({this.isMinimizeSideBar = false});

  final bool? isMinimizeSideBar;

  @override
  Widget build(BuildContext context) {
    return Selector<DashboardPageBloc, int>(
      selector: (context, bloc) => bloc.sidebarItemIndex,
      builder: (BuildContext context, sidebarItemIndex, Widget? child) =>
          Drawer(
        // padding: const EdgeInsets.symmetric(horizontal: kMargin16),
        // width: MediaQuery.of(context).size.width * 0.24,
        // height: MediaQuery.of(context).size.height,
        backgroundColor: kDashboardBgColor,
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const DrawerHeader(child: _AppLogoAndNameView()),
            const _AppLogoAndNameView(),
            const Divider(
              thickness: 0.5,
            ),
            _SideBarItemView(
              itemIcon: Icons.dashboard,
              itemLabel: kTextDashboard,
              indexOfItem: 0,
              isChosen: sidebarItemIndex == 0,
              isMinimize: isMinimizeSideBar ?? false,
            ),
            _SideBarItemView(
              itemIcon: Icons.class_outlined,
              itemLabel: kTextClasses,
              indexOfItem: 1,
              isChosen: sidebarItemIndex == 1,
              isMinimize: isMinimizeSideBar ?? false,
            ),
            _SideBarItemView(
              itemIcon: Icons.group_rounded,
              itemLabel: kTextStudents,
              indexOfItem: 2,
              isChosen: sidebarItemIndex == 2,
              isMinimize: isMinimizeSideBar ?? false,
            ),
            _SideBarItemView(
              itemIcon: Icons.group,
              itemLabel: kTextLectures,
              indexOfItem: 3,
              isChosen: sidebarItemIndex == 3,
              isMinimize: isMinimizeSideBar ?? false,
            ),
            _SideBarItemView(
              itemIcon: Icons.assignment,
              itemLabel: kTextAssignments,
              indexOfItem: 4,
              isChosen: sidebarItemIndex == 4,
              isMinimize: isMinimizeSideBar ?? false,
            ),
            _SideBarItemView(
              itemIcon: Icons.quiz,
              itemLabel: kTextPopQuizzes,
              isChosen: sidebarItemIndex == 5,
              isMinimize: isMinimizeSideBar ?? false,
              indexOfItem: 5,
            ),
            _SideBarItemView(
              itemIcon: Icons.credit_card,
              itemLabel: kTextTransactions,
              indexOfItem: 6,
              isChosen: sidebarItemIndex == 6,
              isMinimize: isMinimizeSideBar ?? false,
            ),
            _SideBarItemView(
              itemIcon: Icons.attach_money,
              itemLabel: kTextPaymentType,
              indexOfItem: 7,
              isChosen: sidebarItemIndex == 7,
              isMinimize: isMinimizeSideBar ?? false,
            ),
          ],
        ),
      ),
    );
  }
}

class _SideBarItemView extends StatelessWidget {
  const _SideBarItemView({
    required this.itemIcon,
    required this.itemLabel,
    required this.indexOfItem,
    required this.isChosen,
    required this.isMinimize,
  });

  final IconData itemIcon;
  final String itemLabel;
  final int indexOfItem;
  final bool isChosen;
  final bool isMinimize;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => GestureDetector(
        onTap: () {
          bloc.onChangePageIndex(indexOfItem);
        },
        child: Container(
          padding: const EdgeInsets.all(kMargin16),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (event) {},
            child: isMinimize
                ? Icon(
                    itemIcon,
                    color: kPrimaryColor,
                    size: isChosen
                        ? kDashboardSelectedMenuItemSize
                        : kDashboardMenuItemSize,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        itemIcon,
                        color: kPrimaryColor,
                        size: isChosen
                            ? kDashboardSelectedMenuItemSize
                            : kDashboardMenuItemSize,
                      ),
                      const SizedBox(
                        width: kMargin16,
                      ),
                      CustomizedTextView(
                        textData: itemLabel,
                        textColor: kWhiteColor,
                        textFontSize: isChosen ? kFont16 : kFont13,
                        textFontWeight:
                            isChosen ? FontWeight.bold : FontWeight.w400,
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _AppLogoAndNameView extends StatelessWidget {
  const _AppLogoAndNameView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin12),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            kAppLogoWithColor,
            width: kAppLogoSize,
            height: kAppLogoSize,
          ),
          const CustomizedTextView(
            textData: kAppName,
            textFontWeight: FontWeight.bold,
            textFontSize: kFont16,
            textColor: kPrimaryColor,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class _DashboardAppBarView extends StatelessWidget {
  const _DashboardAppBarView();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => Padding(
        padding: const EdgeInsets.all(kMargin32),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (Responsive.isDesktop(context)) {
                      bloc.onTapMenu();
                    } else {
                      scaffoldKey.currentState!.openDrawer();
                    }
                  },
                  child: const Icon(
                    Icons.menu,
                    color: kDashboardBgColor,
                  ),
                )),
            const SizedBox(
              width: kMargin16,
            ),
            CustomizedTextView(
              textData: bloc.titleList[bloc.sidebarItemIndex],
              textFontSize: kFont20,
              textFontWeight: FontWeight.w600,
            ),
            const Spacer(),
            CircleAvatar(
              child: Image.asset(
                kAppLogoWithColor,
                width: kAppLogoSize,
                height: kAppLogoSize,
              ),
            ),
            const SizedBox(
              width: kMargin12,
            ),
            const CustomizedTextView(
              textData: "PTK",
              textFontSize: kFont20,
              textFontWeight: FontWeight.w600,
            ),
            const SizedBox(
              width: kMargin16,
            ),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(
              Icons.logout,
              color: kRedColor,
            ), label: Text('Logout')),
            GestureDetector(
              onTap: () {
                //   TODO:
              },
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  Icons.logout,
                  color: kRedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
