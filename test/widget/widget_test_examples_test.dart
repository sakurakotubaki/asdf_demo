import 'package:asdf_demo/ui/widget_test_examples.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WidgetTest example patterns', () {
    testWidgets('Text 表示を確認できる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TextExamplePage()));

      expect(find.byKey(TextExamplePage.messageKey), findsOneWidget);
      expect(find.text('こんにちは WidgetTest'), findsOneWidget);
    });

    testWidgets('Button タップ後に表示が更新される', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ButtonExamplePage()));

      expect(find.text('未タップ'), findsOneWidget);

      await tester.tap(find.byKey(ButtonExamplePage.buttonKey));
      await tester.pump();

      expect(find.text('タップ済み'), findsOneWidget);
    });

    testWidgets('TextField に文字を入力できる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TextFieldExamplePage()));

      await tester.enterText(find.byKey(TextFieldExamplePage.inputKey), 'Taro');
      await tester.pump();

      expect(find.text('入力: Taro'), findsOneWidget);
    });

    testWidgets('Checkbox と Switch の ON/OFF を確認できる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ToggleExamplePage()));

      expect(find.text('未同意'), findsOneWidget);
      expect(find.text('通知オフ'), findsOneWidget);

      await tester.tap(find.byKey(ToggleExamplePage.checkboxKey));
      await tester.tap(find.byKey(ToggleExamplePage.switchKey));
      await tester.pump();

      expect(find.text('同意済み'), findsOneWidget);
      expect(find.text('通知オン'), findsOneWidget);
    });

    testWidgets('List をスクロールして下の項目を探せる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ListExamplePage()));

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 29'), findsNothing);

      await tester.scrollUntilVisible(
        find.text('Item 29'),
        300,
        scrollable: find.byType(Scrollable),
      );

      expect(find.text('Item 29'), findsOneWidget);
    });

    testWidgets('Dialog を表示して閉じられる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: DialogExamplePage()));

      await tester.tap(find.byKey(DialogExamplePage.openButtonKey));
      await tester.pumpAndSettle();

      expect(find.text('確認'), findsOneWidget);

      await tester.tap(find.byKey(DialogExamplePage.closeButtonKey));
      await tester.pumpAndSettle();

      expect(find.text('確認'), findsNothing);
    });

    testWidgets('Navigation で詳細画面に遷移して戻れる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: NavigationExamplePage()));

      await tester.tap(find.byKey(NavigationExamplePage.nextButtonKey));
      await tester.pumpAndSettle();

      expect(find.text('詳細画面'), findsOneWidget);

      await tester.pageBack();
      await tester.pumpAndSettle();

      expect(find.text('一覧'), findsOneWidget);
      expect(find.text('詳細画面'), findsNothing);
    });

    testWidgets('Loading が3秒後に完了表示へ変わる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoadingExamplePage()));

      await tester.tap(find.byKey(LoadingExamplePage.startButtonKey));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump(const Duration(seconds: 3));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('読み込み完了'), findsOneWidget);
    });
  });
}
