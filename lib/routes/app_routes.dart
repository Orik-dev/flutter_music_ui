import 'package:flutter/material.dart';
import 'package:flutter_music_ui/ui/page/home_page.dart';
import 'package:flutter_music_ui/ui/page/player_page.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String playerPage = '/player_page';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    homePage: HomePage.builder,
    playerPage: PlayerPage.builder,
    initialRoute: HomePage.builder,
  };
}
