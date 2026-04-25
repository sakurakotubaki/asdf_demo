# asdf_demo

Widget Test（WidgetTester）で頻繁に使用するメソッドを、実務や練習で役立つように「操作」「更新」「検索」「検証」のカテゴリーに分けて一覧表にしました。

---

### 1. 画面の構築・更新（ライフサイクル系）
Widgetを画面に描画したり、時間の経過をシミュレートする最も重要なメソッドです。

| メソッド | 役割 | 備考 |
| :--- | :--- | :--- |
| **`pumpWidget(widget)`** | 指定したWidgetを描画する | テストの最初に必ず呼び出す「起動」コマンド。 |
| **`pump()`** | 1フレーム（16ms）進める | `setState` 後の画面更新を反映させるために使う。 |
| **`pump(Duration)`** | 指定時間だけ時間を進める | `Future.delayed` やタイマーの待機に使用する。 |
| **`pumpAndSettle()`** | アニメーションが完了するまで待つ | 画面遷移やフェードが完全に終わるまで待機する。 |



---

### 2. ユーザー操作（アクション系）
`while` ループで連打を再現したり、フォーム入力を行ったりする際に使います。

| メソッド | 役割 | 備考 |
| :--- | :--- | :--- |
| **`tap(finder)`** | 1回タップする | ボタン、チェックボックス、リスト項目などに。 |
| **`enterText(finder, text)`** | 文字を入力する | `TextField` の内容を書き換える。 |
| **`drag(finder, offset)`** | ドラッグ操作 | スクロールやスライダーの移動に。 |
| **`longPress(finder)`** | 長押し | コンテキストメニューの表示確認などに。 |
| **`fling(finder, offset, velocity)`** | 素早く払う（フリック） | リストの一番下まで一気にスクロールする時に便利。 |

---

### 3. 要素の検索（Finder系）
画面上のどこに何があるかを見つける「目」の役割です。`find` オブジェクトを使います。

| メソッド | 探す対象 | 推奨される使いどころ |
| :--- | :--- | :--- |
| **`find.byKey(key)`** | 指定した `Key` | **実務で最も推奨。** 重複がなく確実。 |
| **`find.text(string)`** | 特定の文字列 | ラベルやメッセージが正しく出ているか確認。 |
| **`find.byType(Type)`** | Widgetの型 | `ElevatedButton` が1つしかない時などに。 |
| **`find.byIcon(icon)`** | 特定のアイコン | 戻るボタンや保存アイコンの検索に。 |
| **`find.widgetWithText(Type, string)`** | 特定の文字を持つWidget | 「OK」と書かれたボタン、などをピンポイントで探す。 |

---

### 4. 状態の検証（Expectation系）
`expect` 関数と組み合わせて、テストの合否（アサーション）を判定します。

| メソッド | 期待する状態 | 備考 |
| :--- | :--- | :--- |
| **`findsOneWidget`** | 1つだけ存在する | 基本的な存在確認。 |
| **`findsNothing`** | 存在しない | ダイアログが閉じた、エラーが消えた、などの確認。 |
| **`findsNWidgets(n)`** | 指定した `n` 個存在する | リストのアイテム数などの確認。 |
| **`findsWidgets`** | 1つ以上存在する | 個数は問わず、とにかく存在していればOK。 |



---

### 練習用：これらのメソッドを組み合わせた「最強のwhileループ」
例えば、「3回パスワードを間違えて、3秒後にエラーメッセージが消える」というテストはこう書けます。

```dart
// 1. 3回間違える（アクション & 更新）
int count = 0;
while (count < 3) {
  await tester.enterText(find.byKey(const Key('pass_field')), 'error');
  await tester.tap(find.byKey(const Key('login_btn')));
  await tester.pump(); 
  count++;
}

// 2. 状態の検証
expect(find.text('ロックされました'), findsOneWidget);

// 3. 3秒待機（時間操作）
await tester.pump(const Duration(seconds: 3));

// 4. 消えたことを検証
expect(find.text('ロックされました'), findsNothing);
```

---

## 実践パターン集

以下の例は `lib/ui/widget_test_examples.dart` のサンプルWidgetと、`test/widget/widget_test_examples_test.dart` のテストに対応しています。
カウンターは `test/widget/counter_page_test.dart` に作成済みなので、ここではカウンター以外の頻出パターンをまとめています。

### 1. Textの表示確認
画面に特定のテキストが表示されているか確認します。

```dart
testWidgets('Text 表示を確認できる', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: TextExamplePage()));

  expect(find.byKey(TextExamplePage.messageKey), findsOneWidget);
  expect(find.text('こんにちは WidgetTest'), findsOneWidget);
});
```

### 2. Buttonのタップ
ボタンを押して `setState` された結果を `pump()` で反映します。

```dart
testWidgets('Button タップ後に表示が更新される', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: ButtonExamplePage()));

  expect(find.text('未タップ'), findsOneWidget);

  await tester.tap(find.byKey(ButtonExamplePage.buttonKey));
  await tester.pump();

  expect(find.text('タップ済み'), findsOneWidget);
});
```

### 3. TextFieldの入力
`enterText` で入力し、入力後の表示を確認します。

```dart
testWidgets('TextField に文字を入力できる', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: TextFieldExamplePage()));

  await tester.enterText(find.byKey(TextFieldExamplePage.inputKey), 'Taro');
  await tester.pump();

  expect(find.text('入力: Taro'), findsOneWidget);
});
```

### 4. Checkbox / Switchの切り替え
ON/OFF状態を持つWidgetは、タップ前後の表示で状態を確認します。

```dart
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
```

### 5. List / Scroll
最初は見えていない項目を、`scrollUntilVisible` でスクロールして探します。

```dart
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
```

### 6. Dialogの表示とクローズ
ダイアログの表示は `pumpAndSettle()` でアニメーション完了まで待ちます。

```dart
testWidgets('Dialog を表示して閉じられる', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: DialogExamplePage()));

  await tester.tap(find.byKey(DialogExamplePage.openButtonKey));
  await tester.pumpAndSettle();

  expect(find.text('確認'), findsOneWidget);

  await tester.tap(find.byKey(DialogExamplePage.closeButtonKey));
  await tester.pumpAndSettle();

  expect(find.text('確認'), findsNothing);
});
```

### 7. Navigationの画面遷移
画面遷移は `pumpAndSettle()` で遷移アニメーションの完了を待ちます。

```dart
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
```

### 8. Loading / Timer
`Future.delayed` のような時間経過は `pump(Duration)` で進めます。

```dart
testWidgets('Loading が3秒後に完了表示へ変わる', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: LoadingExamplePage()));

  await tester.tap(find.byKey(LoadingExamplePage.startButtonKey));
  await tester.pump();

  expect(find.byType(CircularProgressIndicator), findsOneWidget);

  await tester.pump(const Duration(seconds: 3));

  expect(find.byType(CircularProgressIndicator), findsNothing);
  expect(find.text('読み込み完了'), findsOneWidget);
});
```

---

## 実行方法

追加したサンプルテストを含め、すべてのWidgetTestは次のコマンドで実行できます。

```bash
flutter test
```
