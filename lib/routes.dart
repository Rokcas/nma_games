import 'package:flutter/material.dart';
import 'package:nma_games/pages/main_page.dart';

class Routes {
  static const ROUTE_MAIN = "main";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_MAIN:
        return MaterialPageRoute(builder: (context) {
          return MainPage();
        });
      default:
        throw Exception("Unable to find route ${settings.name} in routes");
    }
  }
}
