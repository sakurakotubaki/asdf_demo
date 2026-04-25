import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('カウント')),
      floatingActionButton: FloatingActionButton(
        key: Key('increment_button'),
        onPressed: _incrementCount,
        child: Icon(Icons.add),
      ),
      body: Center(child: Text('$_count')),
    );
  }
}
