import 'package:flutter/material.dart';

class TextExamplePage extends StatelessWidget {
  const TextExamplePage({super.key});

  static const messageKey = Key('message_text');

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('こんにちは WidgetTest', key: messageKey)),
    );
  }
}

class ButtonExamplePage extends StatefulWidget {
  const ButtonExamplePage({super.key});

  static const buttonKey = Key('greeting_button');

  @override
  State<ButtonExamplePage> createState() => _ButtonExamplePageState();
}

class _ButtonExamplePageState extends State<ButtonExamplePage> {
  String _message = '未タップ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_message),
            ElevatedButton(
              key: ButtonExamplePage.buttonKey,
              onPressed: () {
                setState(() {
                  _message = 'タップ済み';
                });
              },
              child: const Text('更新'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldExamplePage extends StatefulWidget {
  const TextFieldExamplePage({super.key});

  static const inputKey = Key('name_input');

  @override
  State<TextFieldExamplePage> createState() => _TextFieldExamplePageState();
}

class _TextFieldExamplePageState extends State<TextFieldExamplePage> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              key: TextFieldExamplePage.inputKey,
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              decoration: const InputDecoration(labelText: '名前'),
            ),
            Text('入力: $_name'),
          ],
        ),
      ),
    );
  }
}

class ToggleExamplePage extends StatefulWidget {
  const ToggleExamplePage({super.key});

  static const checkboxKey = Key('terms_checkbox');
  static const switchKey = Key('notice_switch');

  @override
  State<ToggleExamplePage> createState() => _ToggleExamplePageState();
}

class _ToggleExamplePageState extends State<ToggleExamplePage> {
  bool _accepted = false;
  bool _noticeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            key: ToggleExamplePage.checkboxKey,
            value: _accepted,
            onChanged: (value) {
              setState(() {
                _accepted = value ?? false;
              });
            },
            title: const Text('利用規約に同意する'),
          ),
          SwitchListTile(
            key: ToggleExamplePage.switchKey,
            value: _noticeEnabled,
            onChanged: (value) {
              setState(() {
                _noticeEnabled = value;
              });
            },
            title: const Text('通知を受け取る'),
          ),
          Text(_accepted ? '同意済み' : '未同意'),
          Text(_noticeEnabled ? '通知オン' : '通知オフ'),
        ],
      ),
    );
  }
}

class ListExamplePage extends StatelessWidget {
  const ListExamplePage({super.key});

  static const listKey = Key('item_list');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        key: listKey,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(key: Key('item_$index'), title: Text('Item $index'));
        },
      ),
    );
  }
}

class DialogExamplePage extends StatelessWidget {
  const DialogExamplePage({super.key});

  static const openButtonKey = Key('open_dialog_button');
  static const closeButtonKey = Key('close_dialog_button');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          key: openButtonKey,
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('確認'),
                  content: const Text('削除しますか？'),
                  actions: [
                    TextButton(
                      key: closeButtonKey,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('閉じる'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('ダイアログを開く'),
        ),
      ),
    );
  }
}

class NavigationExamplePage extends StatelessWidget {
  const NavigationExamplePage({super.key});

  static const nextButtonKey = Key('next_page_button');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('一覧')),
      body: Center(
        child: ElevatedButton(
          key: nextButtonKey,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const DetailExamplePage(),
              ),
            );
          },
          child: const Text('詳細へ'),
        ),
      ),
    );
  }
}

class DetailExamplePage extends StatelessWidget {
  const DetailExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('詳細')),
      body: const Center(child: Text('詳細画面')),
    );
  }
}

class LoadingExamplePage extends StatefulWidget {
  const LoadingExamplePage({super.key});

  static const startButtonKey = Key('start_loading_button');

  @override
  State<LoadingExamplePage> createState() => _LoadingExamplePageState();
}

class _LoadingExamplePageState extends State<LoadingExamplePage> {
  bool _isLoading = false;
  bool _isCompleted = false;

  Future<void> _startLoading() async {
    setState(() {
      _isLoading = true;
      _isCompleted = false;
    });

    await Future<void>.delayed(const Duration(seconds: 3));

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
      _isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              key: LoadingExamplePage.startButtonKey,
              onPressed: _isLoading ? null : _startLoading,
              child: const Text('読み込み開始'),
            ),
            if (_isLoading) const CircularProgressIndicator(),
            if (_isCompleted) const Text('読み込み完了'),
          ],
        ),
      ),
    );
  }
}
