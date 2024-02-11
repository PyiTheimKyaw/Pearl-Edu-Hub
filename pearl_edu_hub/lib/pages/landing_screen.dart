import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_page.dart';
import 'package:pearl_edu_hub/pages/home_page.dart';
import 'package:pearl_edu_hub/route/route_constants.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Beamer(
      key: _beamerKey,
      routerDelegate: BeamerDelegate(
        // NOTE First Method
        locationBuilder: RoutesLocationBuilder(
          routes: {
            '/': (context, state, data) => const BeamPage(
                  key: ValueKey('Home'),
                  type: BeamPageType.scaleTransition,
                  child: HomePage(),
                ),
            RouteConstants.getDashboard: (context, state, data) =>
                const BeamPage(
                  key: ValueKey('Dashboard'),
                  type: BeamPageType.scaleTransition,
                  child: DashboardPage(),
                ),
          },
        ),

        // NOTE Secondary Method
        // locationBuilder: (routeInfo, data) {
        //   if (routeInfo.location!.contains('dashboard')) {
        //     return DashboardLocation(routeInfo);
        //   }
        //   if (routeInfo.location!.contains('settings')) {
        //     return SettingsLocation(routeInfo);
        //   }
        //   if (routeInfo.location!.contains('profile')) {
        //     return ProfileLocation(routeInfo);
        //   }
        //   if (routeInfo.location!.contains('notifications')) {
        //     return NotificationLocation(routeInfo);
        //   }
        //   if (routeInfo.location!.contains('about')) {
        //     return AboutLocation(routeInfo);
        //   }
        //   return NotFound(path: routeInfo.location!.toString());
        // },
      ),
    );
  }
}

class SideNav extends StatefulWidget {
  final GlobalKey<BeamerState> beamer;

  const SideNav({Key? key, required this.beamer}) : super(key: key);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selected = -1;

  @override
  void initState() {
    super.initState();
  }

  List<String> navItems = [
    'Dashboard',
    'Settings',
    'Profile',
    'Notifications',
    'About'
  ];
  List<String> navs = [
    '/dashboard',
    '/settings',
    '/profile',
    '/notifications',
    '/about'
  ];

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    print('path $path');
    if (path.contains('/dashboard')) {
      selected = 0;
    } else if (path.contains('/settings')) {
      selected = 1;
    } else if (path.contains('/profile')) {
      selected = 2;
    } else if (path.contains('/notification')) {
      selected = 3;
    } else if (path.contains('/about')) {
      selected = 4;
    }
    return Container(
      // color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: navItems.map((navItem) {
          return AnimatedContainer(
            key: ValueKey(navItem),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: selected == navItems.indexOf(navItem)
                  ? Colors.grey[850]
                  : Colors.white,
            ),
            duration: const Duration(
              milliseconds: 375,
            ),
            width: 120.0,
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.beamer.currentState?.routerDelegate.beamToNamed(
                        navs[navItems.indexOf(navItem)],
                        data: {"data": "1"});
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    navItem,
                    style: TextStyle(
                      color: selected == navItems.indexOf(navItem)
                          ? Colors.white
                          : Colors.grey[850],
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
