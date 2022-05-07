import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  // Constructor NOP
  MainModel();

  int pushCounter = 0;

  void incrementCounter() {
    pushCounter++;
    notifyListeners();
  }

  void decrementCounter() {
    pushCounter--;
    notifyListeners();
  }
}
