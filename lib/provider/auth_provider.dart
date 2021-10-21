import 'package:flutter/foundation.dart';

import '../models/auth.dart';

class AuthProvider extends ChangeNotifier {
  Auth? auth;

  Auth? get loginData {
    return auth;
  }

  void addAuth({Auth? auth}) {
    this.auth = auth;
    notifyListeners();
  }
}
