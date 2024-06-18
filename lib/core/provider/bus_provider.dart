import 'package:flutter/foundation.dart';

class BusProvider extends ChangeNotifier {
  int _passengers = 1;
  int get passengers => _passengers;

  void addPassenger() {
    _passengers++;
    notifyListeners();
  }

  void removePassenger() {
    if (_passengers > 1) {
      _passengers--;
      notifyListeners();
    }
  }
}
