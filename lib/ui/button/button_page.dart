import 'package:flutter/material.dart';

// ボタンタップ後に小文字は大文字か？
class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  String showMessage = 'abcdefg';
  // ボタンをタップすると、小文字を大文字に変換する
  void _toUppercase() {
    setState(() {
      showMessage = showMessage.toUpperCase();
    });
  }

  // ボタンをタップすると大文字を小文字に変換する
  void _toLowercase() {
    setState(() {
      showMessage = showMessage.toLowerCase();
    });
  }  // ボタンをタップすると、小文字を大文字に変換する
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Text(showMessage),
          ElevatedButton(
            key: const Key('to_lower_button'),
            onPressed: _toLowercase,
            child: Text('小文字に変換'),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        key: const Key('show_message_button'),
        onPressed: _toUppercase,
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
