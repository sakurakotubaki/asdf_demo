import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  static const messageKey = Key('こんにちは TextPage');

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('こんにちは TextPage', key: messageKey)),
    );
  }
}