import 'package:flutter/material.dart';
import 'package:nma_games/pages/add_event_page.dart';
import 'package:nma_games/pages/game_info_page.dart';
import 'package:nma_games/pages/main_page.dart';

import 'add_game_page.dart';

class Routes {
  static const ROUTE_MAIN = "main";
  static const ROUTE_ADD_GAME_PAGE = "add_game_page";
  static const ROUTE_ADD_EVENT_PAGE = "add_event_page";
  static const ROUTE_GAME_INFO = "game_info";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_MAIN:
        return MaterialPageRoute(builder: (context) {
          return MainPage();
        });
      case ROUTE_ADD_GAME_PAGE:
        return MaterialPageRoute(builder: (context) {
          return AddGamePage();
        });
      case ROUTE_ADD_EVENT_PAGE:
        return MaterialPageRoute(builder: (context) {
          return AddEventPage();
        });
      case ROUTE_GAME_INFO:
        return MaterialPageRoute(builder: (context) {
          return GameInfoPage(gameId: settings.arguments);
        });
      default:
        throw Exception("Unable to find route ${settings.name} in routes");
    }
  }
}
