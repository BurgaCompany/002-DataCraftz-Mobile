import 'package:flutter/foundation.dart';

class PageIndexProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
