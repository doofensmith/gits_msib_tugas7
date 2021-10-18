import 'package:flutter/widgets.dart';

import '/bin/login.dart';
import '/bin/search.dart';
import '../bin/artikel.dart';

class AppRoute {
  static const String artikelRoute = '/artikel';
  static const String loginRoute = '/login';
  static const String searchRoute = '/search';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    artikelRoute: (BuildContext context) {
      return const Artikel();
    },
    loginRoute: (BuildContext context) {
      return const LoginPage();
    },
    searchRoute: (BuildContext context) {
      return SearchPage();
    },
  };
}
