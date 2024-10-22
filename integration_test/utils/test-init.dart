import 'package:flutter_test/flutter_test.dart';

import 'package:music_app/main.dart' as app;

Future<void> initTest(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
}
