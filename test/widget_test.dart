import 'package:flutter_test/flutter_test.dart';

import 'package:awdawdasf/main.dart';

void main() {
  testWidgets('Restaurant Menu App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(RestaurantMenuApp());
    expect(find.text('Restaurant Menu'), findsOneWidget);
    expect(find.text('Starters'), findsOneWidget);
  });
}
