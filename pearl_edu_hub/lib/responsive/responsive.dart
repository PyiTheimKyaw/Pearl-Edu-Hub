import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;

  final Widget? tablet;

  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  /// Is Small MobilePhone
  static bool isSmallMobilePhone(BuildContext context) {
    return Responsive.isMediumHandsetFromMediaQuery(context) ||
        Responsive.isSmallHandsetFromMediaQuery(context) ||
        MediaQuery.of(context).size.height <= 740;
  }

  static double getTopMarginForScreensWithAppBar(BuildContext context) {
    return kBottomNavigationBarHeight +
        MediaQuery.of(context).padding.bottom +
        90;
  }

  static double getBottomMarginForScreenWithBottomNavigationBar(
      BuildContext context) {
    return 102;
  }

  static double getHeightForGraduationCeremonySectionInWeb(
      BuildContext context) {
    return MediaQuery.of(context).size.height * 0.7;
  }

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BoxConstraints constraints) {
    final _breakpoint = Breakpoint.fromConstraints(constraints);
    return _breakpoint.device == LayoutClass.largeHandset ||
        _breakpoint.device == LayoutClass.mediumHandset ||
        _breakpoint.device == LayoutClass.smallHandset;
  }

  static bool isSmallMobile(BuildContext context) {
    return MediaQuery.of(context).size.height <= 768;
  }

  static bool isMobileFromMediaQuery(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return _breakpoint.device == LayoutClass.largeHandset ||
        _breakpoint.device == LayoutClass.mediumHandset ||
        _breakpoint.device == LayoutClass.smallHandset ||
        MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BoxConstraints constraints, BuildContext context) {
    return (((constraints.maxWidth <= 1280 && constraints.maxWidth >= 768) &&
        !kIsWeb) ||
        isTabletWeb(context));
  }

  static bool isTabletWeb(BuildContext context) {
    return (((MediaQuery.of(context).size.width <= 820) &&
        (MediaQuery.of(context).size.width >= 768)) &&
        ((MediaQuery.of(context).size.height <= 1180) &&
            (MediaQuery.of(context).size.height >= 800)) &&
        kIsWeb);
  }

  static bool isTabletFromMediaQuery(BuildContext context) {
    return (((MediaQuery.of(context).size.width < 1280 &&
        MediaQuery.of(context).size.width >= 768) &&
        !kIsWeb) ||
        isTabletWeb(context));
  }

  static bool isTabletLandscapePositionFromMediaQuery(BuildContext context) {
    bool isTabletLandScape =
        (((MediaQuery.of(context).size.width <= 1280 && !kIsWeb) ||
            isTabletWeb(context)) &&
            MediaQuery.of(context).size.width >= 960) &&
            (MediaQuery.of(context).orientation == Orientation.landscape);
    return isTabletLandScape;
  }

  static bool isSmallestTabletLandscape(BuildContext context) {
    bool isTabletLandScape = (MediaQuery.of(context).size.width <= 960) &&
        (MediaQuery.of(context).orientation == Orientation.landscape);
    return isTabletLandScape;
  }

  static bool isLargestTabletPortrait(BuildContext context) {
    return (MediaQuery.of(context).size.width == 1080) &&
        (MediaQuery.of(context).orientation == Orientation.portrait);
  }

  static bool isSmallTabletFromMediaQuery(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return _breakpoint.device == LayoutClass.smallTablet;
  }

  static bool isTabletLargerThanNexus9(BuildContext context) {
    return (MediaQuery.of(context).size.width > 1024) &&
        (MediaQuery.of(context).orientation == Orientation.portrait);
  }

  //   static bool isLargeTabletLandscape(BuildContext context) {
  //   bool isLargeScreenWidth = MediaQuery.of(context).size.width >= 1920;
  //   bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
  //   return (isLandscape && isLargeScreenWidth);
  // }

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280 && kIsWeb;

  static bool isDesktopFromMediaQuery(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1280 && kIsWeb;
  }

  static bool isXLargeDesktopFromMediaQuery(BuildContext context) {
    return MediaQuery.of(context).size.width > 1600 && kIsWeb;
  }

  static bool isLargeDesktopFromMediaQuery(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1536 && kIsWeb;
  }

  static bool isSmallTableFromMediaQuery(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return _breakpoint.device == LayoutClass.smallTablet;
  }

  static bool isLargeTableFromMediaQuery(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return _breakpoint.device == LayoutClass.largeTablet;
  }

  static bool isSmallHandsetFromMediaQuery(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return _breakpoint.device == LayoutClass.smallHandset;
  }

  static bool isMediumHandsetFromMediaQuery(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return _breakpoint.device == LayoutClass.mediumHandset;
  }

  static bool isLargeHandsetFromMediaQuery(BuildContext context) {
    final _breakpoint = Breakpoint.fromMediaQuery(context);
    return _breakpoint.device == LayoutClass.largeHandset;
  }

  static bool isSmallDesktopFromMediaQuery(BuildContext context) {
    return MediaQuery.of(context).size.width <= 1280 && kIsWeb;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _breakpoint = Breakpoint.fromConstraints(constraints);
        print(_breakpoint.device);
        if (_breakpoint.device == LayoutClass.largeHandset ||
            _breakpoint.device == LayoutClass.mediumHandset ||
            _breakpoint.device == LayoutClass.smallHandset ||
            MediaQuery.of(context).size.width < 768) {
          return mobile;
        }
        if (((MediaQuery.of(context).size.width <= 1280 && !kIsWeb) &&
            MediaQuery.of(context).size.width >= 768)) {
          return tablet ?? mobile;
        }
        if (isTabletWeb(context)) {
          return tablet ?? mobile;
        }
        if (MediaQuery.of(context).size.width >= 1280) {
          return desktop;
        }

        return desktop;
      },
    );
  }

  /// Check whether the device is Xiaomi A2
  static bool isXiaomiA2(BuildContext context) {
    return (MediaQuery.of(context).size.width == kXiaomiA2Width) &&
        isXiaomiA2Height(context);
  }

  static bool isIPhone6SPlus(BuildContext context) {
    return (MediaQuery.of(context).size.width == kIPhone6SPlusWidth) &&
        (MediaQuery.of(context).size.height == kIPhone6SPlusHeight);
  }

  /// Check whether the device Height is Xiaomi A2
  static bool isXiaomiA2Height(BuildContext context) {
    debugPrint("Device Width =======> ${MediaQuery.of(context).size.width}");
    debugPrint("Device Height =======> ${MediaQuery.of(context).size.height}");
    return (MediaQuery.of(context).size.height >= kXiaomiA2MinHeight) &&
        (MediaQuery.of(context).size.height <= kXiaomiA2MaxHeight);
  }
}

/// Screen Size
const kXiaomiA2Width = 360.0;
const kXiaomiA2MaxHeight = 736.0;
const kXiaomiA2MinHeight = 672.0;

const kIPhone6SPlusHeight = 736.0;
const kIPhone6SPlusWidth = 414;
