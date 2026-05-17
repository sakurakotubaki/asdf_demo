import 'package:flutter/material.dart';

abstract interface class Value<T> {
  T get value;
}

abstract interface class MutableValue<T> implements Value<T> {
  @override
  T get value;

  set value(T value);
}

final class SimpleMutableValue<T> implements MutableValue<T> {
  SimpleMutableValue(this._value);

  T _value;

  @override
  T get value => _value;

  @override
  set value(T value) {
    _value = value;
  }
}

class ValueSamplePage extends StatefulWidget {
  const ValueSamplePage({super.key});

  @override
  State<ValueSamplePage> createState() => _ValueSamplePageState();
}

class _ValueSamplePageState extends State<ValueSamplePage> {
  final MutableValue<int> _counter = SimpleMutableValue<int>(0);

  void _increment() {
    setState(() {
      _counter.value += 1;
    });
  }

  void _decrement() {
    setState(() {
      _counter.value -= 1;
    });
  }

  void _reset() {
    setState(() {
      _counter.value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Value Interface Sample')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReadOnlyCounterView(value: _counter),
              const SizedBox(height: 28),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  IconButton.filled(
                    tooltip: 'decrement',
                    onPressed: _decrement,
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton.filled(
                    tooltip: 'increment',
                    onPressed: _increment,
                    icon: const Icon(Icons.add),
                  ),
                  FilledButton(onPressed: _reset, child: const Text('Reset')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReadOnlyCounterView extends StatelessWidget {
  const ReadOnlyCounterView({super.key, required this.value});

  final Value<int> value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${value.value}', style: textTheme.displayLarge),
        const SizedBox(height: 8),
        Text('Read only: Value<int>', style: textTheme.labelLarge),
      ],
    );
  }
}
