import 'package:flutter/material.dart';
import 'package:asdf_demo/ui/count_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter Tap Test", () {
    testWidgets("1~3 Tab", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const CountPage()));
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      expect(find.text('3'), findsOneWidget);
    });
  });
}
