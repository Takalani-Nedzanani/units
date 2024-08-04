
import 'package:flutter/material.dart';
import 'package:nedzananitakalani_220002027/pages/main_page.dart';
import 'package:nedzananitakalani_220002027/pages/second_page.dart';

class RouteManager {
  // responsible for linking pages
  static const String homePage = '/';
  static const String secondPage = '/secondPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );

      case secondPage:
        return MaterialPageRoute(
          builder: (context) => const SecondPage(),
        );

      default:
        throw const FormatException('Route not found! check routes again!');
    }
  }
}
