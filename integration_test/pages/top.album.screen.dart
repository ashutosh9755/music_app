import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_test/flutter_test.dart';
import '../utils/base.page.dart';

class TopAlbumScreen extends BasePage {
  TopAlbumScreen(WidgetTester tester) : super(tester);

  final favouriteButton = find.byType(FavoriteButton).at(3);
  final backButton = find.byTooltip("Back");

  Future<Finder> hasTopAlbumCardForArtist(String albumName) async {
    return find.text(albumName);
  }

  Future<void> tapTopAlbumCard(String albumName) async {
    await tapOnCard(albumName);
    await waitAndSync(2);
  }

  Future<void> tapTopTrackCard(String trackName) async {
    await tapOnCard(trackName);
    await waitAndSync(2);
  }

  Future<bool> hasAlbumTitlePresent(String albumTitle) async {
    final topAlbumName = find.text(albumTitle);
    return isElementPresent(topAlbumName);
  }

  Future<void> tapFavouriteButton() async {
    await tapOnElement(favouriteButton);
    await waitAndSync(2);
  }

  Future<void> navigateToPreviousScreen() async {
    await tapOnElement(backButton);
    await waitAndSync(2);
  }
}
