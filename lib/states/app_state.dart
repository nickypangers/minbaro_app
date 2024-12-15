import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  bool _shouldBlurApp = false;

  bool get shouldBlurApp => _shouldBlurApp;

  void blur() {
    _shouldBlurApp = true;
    notifyListeners();
  }

  void unblur() {
    _shouldBlurApp = false;
    notifyListeners();
  }
}
