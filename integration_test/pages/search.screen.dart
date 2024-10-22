import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';
import '../utils/base.page.dart';

class SearchScreen extends BasePage {
  SearchScreen(WidgetTester tester) : super(tester);

  final searchbutton = find.byType(AppbarSearchButton);
  final searchField = find.byType(TextField);
  final backButton = find.byTooltip("Back");

  Future<void> typeArtistNameandSearch(String artistname) async {
    await setValue(searchField, artistname);
    await tapOnElement(searchbutton);
    await waitAndSync(2);
  }

  Future<bool> hasSearchFieldPresent() async {
    return isElementPresent(searchField);
  }

  Future<void> navigateToPreviousScreen() async {
    await tapOnElement(backButton);
    await waitAndSync(2);
  }
}
