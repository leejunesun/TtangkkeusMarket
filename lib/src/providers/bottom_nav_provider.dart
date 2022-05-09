import 'package:flutter/material.dart';

class BottomNavigationProvier extends ChangeNotifier {
  int _selectIndex = 0;

  int get currentPage => _selectIndex;
  updateCurrentPage(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
