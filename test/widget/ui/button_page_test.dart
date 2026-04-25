import 'package:asdf_demo/ui/button/button_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ボタンタップ後に', () {
    testWidgets("対象のKeyにテキストがあるか？", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ButtonPage()));

      expect(find.byKey(const Key('show_message_button')), findsOneWidget);
      expect(find.text("abcdefg"), findsOneWidget);
      // ボタンをタップ
      await tester.tap(find.byKey(const Key('show_message_button')));
      // 描画更新
      await tester.pump();
      // テキストが大文字になっていることを確認
      expect(find.text("ABCDEFG"), findsOneWidget);
    });

    testWidgets("小文字に変換ボタンをタップすると、小文字に変換されるか？", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ButtonPage()));

      expect(find.byKey(const Key('to_lower_button')), findsOneWidget);
      expect(find.text("abcdefg"), findsOneWidget);
      // ボタンをタップ
      await tester.tap(find.byKey(const Key('to_lower_button')));
      // 描画更新
      await tester.pump();
      // テキストが小文字になっていることを確認
      expect(find.text("abcdefg"), findsOneWidget);
    });
  });
}
