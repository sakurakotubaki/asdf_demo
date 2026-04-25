import 'package:asdf_demo/ui/text/text_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("対象のKeyにテキストがあるか？", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: const TextPage()));

    expect(find.byKey(TextPage.messageKey), findsOneWidget);
    expect(find.text("こんにちは TextPage"), findsOneWidget);
  });
}