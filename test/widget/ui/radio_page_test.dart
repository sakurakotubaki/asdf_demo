import 'package:asdf_demo/ui/radio/radio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WidgetTest', () {
    testWidgets("ラジオボタンを選択できるか？", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RadioPage()));

      expect(find.text('男性'), findsOneWidget);
      expect(find.text('女性'), findsOneWidget);
      expect(find.byKey(RadioPage.selectedTextKey), findsOneWidget);
      expect(find.text('選択中: 男性'), findsOneWidget);

      // 女性を選択
      await tester.tap(find.byKey(RadioPage.womenRadioKey));
      await tester.pump();

      expect(find.text('選択中: 女性'), findsOneWidget);

      // 男性を選択
      await tester.tap(find.byKey(RadioPage.menRadioKey));
      await tester.pump();

      expect(find.text('選択中: 男性'), findsOneWidget);
    });
  });
}
