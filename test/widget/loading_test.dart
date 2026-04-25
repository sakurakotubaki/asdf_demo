import 'package:asdf_demo/ui/widget_test_examples.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('3秒経過したらローディングインジケーターが消えること', (WidgetTester tester) async {
    // 1. アプリを起動して、ローディングを開始させる（例：ボタン押下）
    await tester.pumpWidget(const MaterialApp(home: LoadingExamplePage()));
    await tester.tap(find.byKey(LoadingExamplePage.startButtonKey));
    await tester.pump(); // 描画更新

    // 2. インジケーターが表示されていることを確認
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    int secondsElapsed = 0;
    const int timeout = 3;

    // 3. while文で1秒ずつ進めながら状態を監視する
    while (secondsElapsed < timeout) {
      // 1秒進める
      await tester.pump(const Duration(seconds: 1));
      secondsElapsed++;

      if (secondsElapsed < timeout) {
        // まだ3秒経っていないなら、表示されているはず
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      }
    }

    // 4. 3秒経過後、インジケーターが消えている（存在しない）ことを確認
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('読み込み完了'), findsOneWidget);
  });
}
