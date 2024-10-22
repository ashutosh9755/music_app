import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class BasePage {
  late WidgetTester _tester;

  BasePage(WidgetTester tester) {
    _tester = tester;
  }

  Future<void> tapOnElement(Finder finder) async {
    await _tester.tap(finder);
  }

  Future<void> tapOnCard(String cardName) async {
    await tapOnElement(
        find.descendant(of: find.byType(Card), matching: find.text(cardName)));
  }

  Future<void> waitAndSync(int timeInSec) async {
    await _tester.pump(Duration(seconds: timeInSec));
  }

  Future<void> setValue(Finder finder, String textToSet) async {
    await _tester.enterText(finder, textToSet);
  }

  Future<bool> isElementPresent(Finder finder) async {
    return _tester.any(finder);
  }

  Future<bool> isWidgetPresent(Finder finder) async {
    return _tester.widget(finder);
  }
}
