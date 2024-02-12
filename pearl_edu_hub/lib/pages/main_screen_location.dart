import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/pages/home_page.dart';
import 'package:pearl_edu_hub/pages/landing_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
          key: ValueKey('home-${DateTime.now()}'),
          child: const LandingScreen()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/*'];
}
