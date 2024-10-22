import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../pages/home.screen.dart';
import '../pages/search.screen.dart';
import '../pages/top.album.screen.dart';
import '../utils/test-init.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration test', () {
    testWidgets(
        'Verify adding a favourite Track/Song then removing it from Homescreen',
        (WidgetTester tester) async {
      // Load app widget.
      await initTest(tester);
      final homeScreen = HomeScreen(tester);
      final searchScreen = SearchScreen(tester);
      final topAlbumScreen = TopAlbumScreen(tester);

      //clicking on search button
      await homeScreen.tapOnSearchIcon();

      //searching Album based on Artist name
      await searchScreen.typeArtistNameandSearch('David Guetta');

      //searching Specific Track/Song based in Album
      await topAlbumScreen.tapTopAlbumCard('David Guetta Feat. Rihanna');

      //Mark a Track as Favourite
      await topAlbumScreen.tapFavouriteButton();

      //Navigate back to Homescreen and verify if Track is added as favourite sucessfully.
      await topAlbumScreen.navigateToPreviousScreen();
      await searchScreen.navigateToPreviousScreen();

      //Remove the Favourite Track and Verify No Favoutite present on Homescreen
      await homeScreen.tapHomeScreenFavouriteButton();
      expect(await homeScreen.hasNoFavouriteAlbumsPresent(), true,
          reason: "Track is not sucessfully removed as Favourite");
    });
  });
}
