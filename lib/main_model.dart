import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  /// コンストラクタ NOP
  MainModel();

  int pushCounter = 0;

  /// カウンタをインクリメントするメソッド
  void incrementCounter() {
    pushCounter++;
    notifyListeners();
  }

  /// カウンタをデクリメントするメソッド
  void decrementCounter() {
    pushCounter--;
    notifyListeners();
  }
}
