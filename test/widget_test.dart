import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asdf_demo/main.dart';

void main() {
  testWidgets('ボタンを100回連打してもクラッシュせず、正しくカウントされること', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    int pushCount = 0;
    const int maxPushes = 100;

    // while文で100回タップをシミュレート
    while (pushCount < maxPushes) {
      await tester.tap(find.byType(FloatingActionButton));
      pushCount++;

      // 描画更新（アニメーションがない場合は pump()、ある場合は pumpAndSettle()）
      await tester.pump();
    }

    // 結果の検証
    expect(find.text('100'), findsOneWidget);
    expect(find.text('エラー'), findsNothing); // 壊れていないこと
  });
}
