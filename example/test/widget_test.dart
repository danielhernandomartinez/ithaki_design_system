import 'package:flutter_test/flutter_test.dart';
import 'package:ithaki_catalog/main.dart';

void main() {
  testWidgets('Catalog app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const CatalogApp());
    expect(find.text('Ithaki Widget Catalog'), findsOneWidget);
  });
}