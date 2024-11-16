import 'package:flutter_test/flutter_test.dart';

import 'package:restaurent_app/main.dart';

void main() {
  testWidgets('Restaurant Menu App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RestaurantMenuApp());

    expect(find.text('Restaurant Menu'), findsOneWidget);
    expect(find.text('Starters'), findsOneWidget);

  });
}
