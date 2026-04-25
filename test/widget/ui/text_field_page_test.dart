import 'package:asdf_demo/ui/text_field/text_field_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WidgetTest', () {
    testWidgets("名前は田中太郎か？", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const TextFieldPage()));
      // 入力された名前は田中太郎か？
      await tester.enterText(find.byKey(const Key('name_input')), '田中太郎');
      await tester.pump();
      expect(find.text('田中太郎'), findsOneWidget);

      expect(_RegExpJa.isKanji('田中太郎'), isTrue);
    });
  });
}

class _RegExpJa {
  // 漢字で田中太郎か？
  static const kanji = r'^[一-龠々]+$';

  static bool isKanji(String text) {
    return RegExp(kanji).hasMatch(text);
  }
}
