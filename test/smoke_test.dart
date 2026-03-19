import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ithaki_design_system/ithaki_design_system.dart';

void main() {
  test('IthakiTheme exports primary purple color', () {
    expect(IthakiTheme.primaryPurple.toARGB32(), equals(const Color(0xFF905CFF).toARGB32()));
  });

  testWidgets('IthakiButton renders with label', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IthakiButton('Test'),
        ),
      ),
    );
    expect(find.text('Test'), findsOneWidget);
  });

  test('IthakiIcon uses package-prefixed asset path', () {
    const icon = IthakiIcon('check', size: 20);
    expect(icon.name, equals('check'));
  });
}
