import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/blocs/dashboard_page_bloc.dart';
import 'package:pearl_edu_hub/pages/dashboard/admin_dashboard_page.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_class_details_page.dart';
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
import 'package:pearl_edu_hub/route/route_constants.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DashboardPageBloc(),
      child: Scaffold(
        backgroundColor: kLowOpacityWhiteColor,
        key: scaffoldKey,
        drawerEnableOpenDragGesture: false,
        drawer: _SideBarSectionView(
          beamer: _beamerKey,
        ),
        body: Selector<DashboardPageBloc, int>(
          selector: (context, bloc) => bloc.sidebarItemIndex,
          shouldRebuild: (next, prev) => next != prev,
          builder: (BuildContext context, sidebarItemIndex, Widget? child) =>
              Responsive(
                  mobile: _ContentsSectionView(
                    sidebarItemIndex: sidebarItemIndex,
                    beamer: _beamerKey,
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
                                    ? _SideBarSectionView(
                                        beamer: _beamerKey,
                                      )
                                    : SizedBox(
                                        width: 100,
                                        child: _SideBarSectionView(
                                          isMinimizeSideBar: true,
                                          beamer: _beamerKey,
                                        ),
                                      )),
                      ),
                      Expanded(
                        flex: 4,
                        child: _ContentsSectionView(
                          sidebarItemIndex: sidebarItemIndex,
                          beamer: _beamerKey,
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
    required this.beamer,
  });

  final int sidebarItemIndex;
  final GlobalKey<BeamerState> beamer;

  @override
  Widget build(BuildContext context) {
    return Beamer(
      key: beamer,
      routerDelegate: BeamerDelegate(
        // NOTE First Method
        // locationBuilder: RoutesLocationBuilder(
        //   routes: {
        //     '*': (context, state, data) => const SizedBox(),
        //     RouteConstants.getClasses: (context, state, data) {
        //
        //       return BeamPage(
        //         key: const ValueKey(kTextClasses),
        //         type: BeamPageType.scaleTransition,
        //         child: DashboardClassesPage(
        //           onTapMenu: () {
        //             var bloc =
        //                 Provider.of<DashboardPageBloc>(context, listen: false);
        //             if (Responsive.isDesktop(context)) {
        //               bloc.onTapMenu();
        //             } else {
        //               scaffoldKey.currentState!.openDrawer();
        //             }
        //           },
        //         ),
        //       );
        //     },
        //     '${RouteConstants.getClasses}/:classId' : (context,state,data){
        //       final String? bookIdParameter = state.pathParameters['classId'];
        //       print("Class id => $bookIdParameter");
        //       if (bookIdParameter != null) {
        //         final bookId = int.tryParse(bookIdParameter);
        //         // final book = books.firstWhereOrNull((book) => book.id == bookId);
        //
        //         return  BeamPage(
        //             key: ValueKey('book-$bookIdParameter'),
        //             title: 'Book #$bookIdParameter',
        //             child: DashboardClassDetailsPage(classItem: "bookId ?? 0",),
        //           );
        //
        //       }else{
        //         return SizedBox();
        //       }
        //     },
        //     RouteConstants.getDashboard: (context, state, data) => BeamPage(
        //           key: const ValueKey(kTextDashboard),
        //           type: BeamPageType.scaleTransition,
        //           child: AdminDashboardPage(
        //             onTapInfoItem: (index) {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               bloc.onChangePageIndex(index);
        //             },
        //             onTapMenu: () {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               if (Responsive.isDesktop(context)) {
        //                 bloc.onTapMenu();
        //               } else {
        //                 scaffoldKey.currentState!.openDrawer();
        //               }
        //             },
        //           ),
        //         ),
        //     RouteConstants.getStudents: (context, state, data) => BeamPage(
        //           key: const ValueKey(kTextStudents),
        //           type: BeamPageType.scaleTransition,
        //           child: DashboardStudentsPage(
        //             onTapMenu: () {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               if (Responsive.isDesktop(context)) {
        //                 bloc.onTapMenu();
        //               } else {
        //                 scaffoldKey.currentState!.openDrawer();
        //               }
        //             },
        //           ),
        //         ),
        //     RouteConstants.getLectures: (context, state, data) => BeamPage(
        //           key: const ValueKey(kTextLectures),
        //           type: BeamPageType.scaleTransition,
        //           child: DashboardLecturesPage(
        //             onTapMenu: () {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               if (Responsive.isDesktop(context)) {
        //                 bloc.onTapMenu();
        //               } else {
        //                 scaffoldKey.currentState!.openDrawer();
        //               }
        //             },
        //           ),
        //         ),
        //     RouteConstants.getAssignments: (context, state, data) => BeamPage(
        //           key: const ValueKey(kTextAssignments),
        //           type: BeamPageType.scaleTransition,
        //           child: DashboardAssignmentsPage(
        //             onTapMenu: () {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               if (Responsive.isDesktop(context)) {
        //                 bloc.onTapMenu();
        //               } else {
        //                 scaffoldKey.currentState!.openDrawer();
        //               }
        //             },
        //           ),
        //         ),
        //     RouteConstants.getQuizzes: (context, state, data) => BeamPage(
        //           key: const ValueKey(kTextPopQuizzes),
        //           type: BeamPageType.scaleTransition,
        //           child: DashboardPopQuizzesPage(
        //             onTapMenu: () {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               if (Responsive.isDesktop(context)) {
        //                 bloc.onTapMenu();
        //               } else {
        //                 scaffoldKey.currentState!.openDrawer();
        //               }
        //             },
        //           ),
        //         ),
        //     RouteConstants.getTransactions: (context, state, data) => BeamPage(
        //           key: const ValueKey(kTextTransactions),
        //           type: BeamPageType.scaleTransition,
        //           child: DashboardTransactionsPage(
        //             onTapMenu: () {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               if (Responsive.isDesktop(context)) {
        //                 bloc.onTapMenu();
        //               } else {
        //                 scaffoldKey.currentState!.openDrawer();
        //               }
        //             },
        //           ),
        //         ),
        //     RouteConstants.getPaymentTypes: (context, state, data) => BeamPage(
        //           key: const ValueKey(kTextPaymentType),
        //           type: BeamPageType.scaleTransition,
        //           child: DashboardPaymentTypesPage(
        //             onTapMenu: () {
        //               var bloc = Provider.of<DashboardPageBloc>(context,
        //                   listen: false);
        //               if (Responsive.isDesktop(context)) {
        //                 bloc.onTapMenu();
        //               } else {
        //                 scaffoldKey.currentState!.openDrawer();
        //               }
        //             },
        //           ),
        //         ),
        //   },
        // ),

        // NOTE Secondary Method
        locationBuilder: (routeInfo, data) {
          print("ROUTE IS IS ${routeInfo.uri.pathSegments}");
          if (routeInfo.uri.pathSegments.join("") == 'dashboard') {
            return DashboardLocation();
          }
          if (routeInfo.uri.pathSegments.contains('classes')) {
            return ClassesLocation();
          }
          if (routeInfo.uri.pathSegments.contains('students')) {
            return StudentsLocation();
          }
          if (routeInfo.uri.pathSegments.contains('lectures')) {
            return LectureLocation();
          }
          if (routeInfo.uri.pathSegments.contains('assignments')) {
            return AssignmentsLocation();
          }

          if (routeInfo.uri.pathSegments.contains('quizzes')) {
            return QuizzesLocation();
          }
          if (routeInfo.uri.pathSegments.contains('transactions')) {
            return TransactionsLocation();
          }
          if (routeInfo.uri.pathSegments.contains('payment-types')) {
            return PaymentTypesLocation();
          }

          return NotFound(path: routeInfo.uri.pathSegments.toString());
        },
      ),
    );
  }
}

class PaymentTypesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextPaymentType),
        title: kAppName,
        child: DashboardPaymentTypesPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [RouteConstants.getPaymentTypes];
}

class TransactionsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextTransactions),
        title: kAppName,
        child: DashboardTransactionsPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [RouteConstants.getTransactions];
}

class QuizzesLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextPopQuizzes),
        title: kAppName,
        child: DashboardPopQuizzesPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => ['${RouteConstants.getQuizzes}:/quizId'];
}

class AssignmentsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextAssignments),
        title: kAppName,
        child: DashboardAssignmentsPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns =>
      ['${RouteConstants.getAssignments}:/assignmentId'];
}

class LectureLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextLectures),
        title: kAppName,
        child: DashboardLecturesPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns =>
      ['${RouteConstants.getLectures}:/lectureId'];
}

class DashboardLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextDashboard),
        title: kAppName,
        child: AdminDashboardPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
          onTapInfoItem: (item) {},
        ),
      ),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [RouteConstants.getDashboard];
}

class StudentsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextStudents),
        title: kAppName,
        child: DashboardStudentsPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
    ];
    return pages;
  }

  @override
  List<Pattern> get pathPatterns =>
      ['${RouteConstants.getStudents}/:studentId'];
}

class ClassesLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['${RouteConstants.getClasses}/:classId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey(kTextClasses),
        title: kAppName,
        child: DashboardClassesPage(
          onTapMenu: () {
            var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
            if (Responsive.isDesktop(context)) {
              bloc.onTapMenu();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
    ];
    final String? bookIdParameter = state.pathParameters['classId'];
    print("PARA $bookIdParameter");
    if (bookIdParameter != null) {
      pages.add(
        BeamPage(
          key: ValueKey('book-$bookIdParameter'),
          title: kAppName,
          child: DashboardClassDetailsPage(
            classId: bookIdParameter,
            onTapMenu: () {
              var bloc = Provider.of<DashboardPageBloc>(context, listen: false);
              if (Responsive.isDesktop(context)) {
                bloc.onTapMenu();
              } else {
                scaffoldKey.currentState!.openDrawer();
              }
            },
          ),
        ),
      );
    }
    return pages;
  }
}

class _SideBarSectionView extends StatefulWidget {
  const _SideBarSectionView(
      {this.isMinimizeSideBar = false, required this.beamer});

  final GlobalKey<BeamerState> beamer;
  final bool? isMinimizeSideBar;

  @override
  State<_SideBarSectionView> createState() => _SideBarSectionViewState();
}

class _SideBarSectionViewState extends State<_SideBarSectionView> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> navs = [
      RouteConstants.getDashboard,
      RouteConstants.getClasses,
      RouteConstants.getStudents,
      RouteConstants.getLectures,
      RouteConstants.getAssignments,
      RouteConstants.getQuizzes,
      RouteConstants.getTransactions,
      RouteConstants.getPaymentTypes,
    ];
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    print('path $path');
    if (path == (RouteConstants.getDashboard)) {
      selected = 0;
    } else if (path.contains(RouteConstants.getClasses)) {
      selected = 1;
    } else if (path.contains(RouteConstants.getStudents)) {
      selected = 2;
    } else if (path.contains(RouteConstants.getLectures)) {
      selected = 3;
    } else if (path.contains(RouteConstants.getAssignments)) {
      selected = 4;
    } else if (path.contains(RouteConstants.getQuizzes)) {
      selected = 5;
    } else if (path.contains(RouteConstants.getTransactions)) {
      selected = 6;
    } else if (path.contains(RouteConstants.getPaymentTypes)) {
      selected = 7;
    }
    return Selector<DashboardPageBloc, int>(
        selector: (context, bloc) => bloc.sidebarItemIndex,
        builder: (context, sidebarItemIndex, Widget? child) {
          return Drawer(
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
                  isChosen: selected == 0,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[0], data: {"data": "1"});
                      print("Change index ${navs[0]}");
                    });
                  },
                ),
                _SideBarItemView(
                  itemIcon: Icons.class_outlined,
                  itemLabel: kTextClasses,
                  indexOfItem: 1,
                  isChosen: selected == 1,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[1], data: {"data": "1"});
                      print("Change index ${navs[1]}");
                    });
                  },
                ),
                _SideBarItemView(
                  itemIcon: Icons.group_rounded,
                  itemLabel: kTextStudents,
                  indexOfItem: 2,
                  isChosen: selected == 2,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[2], data: {"data": "1"});
                      print("Change index ${navs[2]}");
                    });
                  },
                ),
                _SideBarItemView(
                  itemIcon: Icons.group,
                  itemLabel: kTextLectures,
                  indexOfItem: 3,
                  isChosen: selected == 3,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[3], data: {"data": "1"});
                      print("Change index ${navs[3]}");
                    });
                  },
                ),
                _SideBarItemView(
                  itemIcon: Icons.assignment,
                  itemLabel: kTextAssignments,
                  indexOfItem: 4,
                  isChosen: selected == 4,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[4], data: {"data": "1"});
                      print("Change index ${navs[4]}");
                    });
                  },
                ),
                _SideBarItemView(
                  itemIcon: Icons.quiz,
                  itemLabel: kTextPopQuizzes,
                  isChosen: selected == 5,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  indexOfItem: 5,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[5], data: {"data": "1"});
                      print("Change index ${navs[5]}");
                    });
                  },
                ),
                _SideBarItemView(
                  itemIcon: Icons.credit_card,
                  itemLabel: kTextTransactions,
                  indexOfItem: 6,
                  isChosen: selected == 6,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[6], data: {"data": "1"});
                      print("Change index ${navs[6]}");
                    });
                  },
                ),
                _SideBarItemView(
                  itemIcon: Icons.attach_money,
                  itemLabel: kTextPaymentType,
                  indexOfItem: 7,
                  isChosen: selected == 7,
                  isMinimize: widget.isMinimizeSideBar ?? false,
                  onChoose: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[7], data: {"data": "1"});
                      print("Change index ${navs[7]}");
                    });
                  },
                ),
              ],
            ),
          );
        });
  }
}

class _SideBarItemView extends StatefulWidget {
  const _SideBarItemView({
    required this.itemIcon,
    required this.itemLabel,
    required this.indexOfItem,
    required this.isChosen,
    required this.isMinimize,
    required this.onChoose,
  });

  final IconData itemIcon;
  final String itemLabel;
  final int indexOfItem;
  final bool isChosen;
  final bool isMinimize;
  final Function onChoose;

  @override
  State<_SideBarItemView> createState() => _SideBarItemViewState();
}

class _SideBarItemViewState extends State<_SideBarItemView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => InkWell(
        onTap: () {
          widget.onChoose();
        },
        child: Container(
          padding: const EdgeInsets.all(kMargin16),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (event) {},
            child: widget.isMinimize
                ? Icon(
                    widget.itemIcon,
                    color: kPrimaryColor,
                    size: widget.isChosen
                        ? kDashboardSelectedMenuItemSize
                        : kDashboardMenuItemSize,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        widget.itemIcon,
                        color: kPrimaryColor,
                        size: widget.isChosen
                            ? kDashboardSelectedMenuItemSize
                            : kDashboardMenuItemSize,
                      ),
                      const SizedBox(
                        width: kMargin16,
                      ),
                      CustomizedTextView(
                        textData: widget.itemLabel,
                        textColor: kWhiteColor,
                        textFontSize: widget.isChosen ? kFont16 : kFont13,
                        textFontWeight:
                            widget.isChosen ? FontWeight.bold : FontWeight.w400,
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
