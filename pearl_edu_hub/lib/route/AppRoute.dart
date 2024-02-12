import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_page.dart';

class AppRoute {
  // static GoRouter returnRouter(bool isAuth) {
  //   GoRouter goRouter = GoRouter(
  //     routes: [
  //       GoRoute(
  //           path: "/",
  //           name: 'home_page',
  //           pageBuilder: (context, state) {
  //             return const MaterialPage(child: HomePage());
  //           }),
  //       GoRoute(
  //           path: "/dashboard",
  //           name: 'dashboard_page',
  //           pageBuilder: (context, state) {
  //             return const MaterialPage(child: DashboardPage());
  //           }),
  //       GoRoute(
  //           path: "/about",
  //           name: 'about_page',
  //           pageBuilder: (context, state) {
  //             return const MaterialPage(child: AboutPage());
  //           }),
  //     ],
  //   );
  //   return goRouter;
  // }

   GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const DashboardPage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'dashboard',
            path: 'dashboard',
            builder: (BuildContext context, GoRouterState state) {
              return const DashboardPage();
            },
          ),
        ],
      ),
    ],
  );
}
