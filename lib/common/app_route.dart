import 'package:flutter/widgets.dart';
import 'package:gits_msib_tugas7/bin/artikel.dart';

class AppRoute {
  static const String artikelRoute = '/artikel';
  static const String loginRoute = '/login';
  static const String searchRoute = '/search';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    artikelRoute: (BuildContext context) {
      return const Artikel();
    },
    loginRoute: (BuildContext context) {
      return const Artikel();
    },
    searchRoute: (BuildContext context) {
      return const Artikel();
    },
  };
}
