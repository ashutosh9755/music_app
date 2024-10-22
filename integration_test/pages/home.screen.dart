import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';

import '../utils/base.page.dart';

class HomeScreen extends BasePage {
  HomeScreen(WidgetTester tester) : super(tester);

  final searchbutton = find.byType(AppbarSearchButton);
  final appTitleText = find.text('Music App');
  final noAlbumsText = find.text('No Albums added yet');
  final favouriteButton = find.byType(FavoriteButton);

  Future<bool> hasSearchButtonPresent() async {
    return isElementPresent(searchbutton);
  }

  Future<void> tapOnSearchIcon() async {
    await tapOnElement(searchbutton);
    await waitAndSync(2);
  }

  Future<bool> hasTitlePresent() async {
    return isElementPresent(appTitleText);
  }

  Future<bool> hasNoFavouriteAlbumsPresent() async {
    return isElementPresent(noAlbumsText);
  }

  Future<void> tapHomeScreenFavouriteButton() async {
    await tapOnElement(favouriteButton);
    await waitAndSync(2);
  }
}
