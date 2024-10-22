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
        'Validate Screen UI & verify Searching Artist->Album->Track & adding as favourite',
        (WidgetTester tester) async {
      // Load app widget.
      await initTest(tester);
      final homeScreen = HomeScreen(tester);
      final searchScreen = SearchScreen(tester);
      final topAlbumScreen = TopAlbumScreen(tester);

      //Validating Homescreen UI and clicking on search button
      expect(await homeScreen.hasTitlePresent(), true,
          reason: "Title 'Music App' is not present");
      expect(await homeScreen.hasNoFavouriteAlbumsPresent(), true,
          reason: "Info message 'No Albums added yet' is not present");
      expect(await homeScreen.hasSearchButtonPresent(), true,
          reason: "Search button is not present");
      await homeScreen.tapOnSearchIcon();

      //Validating Searchscreen UI and verifying search functinality based on Artist name
      expect(await searchScreen.hasSearchFieldPresent(), true,
          reason: "Search text field is not present");
      await searchScreen.typeArtistNameandSearch('Justin Bieber');

      //Validating Top album card exist after search and clicking on specific Top album
      expect(
          await topAlbumScreen
              .hasTopAlbumCardForArtist('Justin Bieber, Nicki Minaj'),
          findsOneWidget,
          reason:
              "Expected Top Album card for Artist is missing in search result");
      await topAlbumScreen.tapTopAlbumCard('Justin Bieber, Nicki Minaj');
      expect(
          await topAlbumScreen
              .hasAlbumTitlePresent('Justin Bieber, Nicki Minaj Top Albums'),
          true,
          reason: "Top Album title is not present");

      //Validating Track/Song card exist after search and and marking Track as Favourite
      expect(await topAlbumScreen.hasTopAlbumCardForArtist('Believe'),
          findsOneWidget,
          reason:
              "Expected Top Album card for Artist is missing in search result");
      await topAlbumScreen.tapFavouriteButton();

      //Navigate back to Homescreen and verify if Track is added as favourite sucessfully.
      await topAlbumScreen.navigateToPreviousScreen();
      await searchScreen.navigateToPreviousScreen();
      expect(await homeScreen.hasNoFavouriteAlbumsPresent(), false,
          reason: "Track is not sucessfully added as Favourite");

      await homeScreen.tapHomeScreenFavouriteButton();
      //  await tester.pump(Duration(milliseconds: 10000));
      expect(await homeScreen.hasNoFavouriteAlbumsPresent(), true,
          reason: "Track is not sucessfully removed as Favourite");
    });
  });
}
