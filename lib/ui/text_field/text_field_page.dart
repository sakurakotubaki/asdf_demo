import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              key: const Key('name_input'),
              controller: _controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: '名前',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}