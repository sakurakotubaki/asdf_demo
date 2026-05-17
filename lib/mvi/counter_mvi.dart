import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_mvi.g.dart';

final class CounterState {
  const CounterState({required this.count, required this.lastIntentLabel});

  const CounterState.initial() : count = 0, lastIntentLabel = 'initial';

  final int count;
  final String lastIntentLabel;

  bool get canDecrement => count > 0;

  CounterState copyWith({int? count, String? lastIntentLabel}) {
    return CounterState(
      count: count ?? this.count,
      lastIntentLabel: lastIntentLabel ?? this.lastIntentLabel,
    );
  }
}

sealed class CounterIntent {
  const CounterIntent();
}

final class CounterIncrementPressed extends CounterIntent {
  const CounterIncrementPressed();
}

final class CounterDecrementPressed extends CounterIntent {
  const CounterDecrementPressed();
}

final class CounterResetPressed extends CounterIntent {
  const CounterResetPressed();
}

sealed class CounterEffect {
  const CounterEffect();
}

final class CounterShowMessage extends CounterEffect {
  const CounterShowMessage(this.message);

  final String message;
}

@riverpod
class CounterStore extends _$CounterStore {
  final _effects = StreamController<CounterEffect>.broadcast();

  Stream<CounterEffect> get effectStream => _effects.stream;

  @override
  CounterState build() {
    ref.onDispose(_effects.close);
    return const CounterState.initial();
  }

  void dispatch(CounterIntent intent) {
    switch (intent) {
      case CounterIncrementPressed():
        _increment();
      case CounterDecrementPressed():
        _decrement();
      case CounterResetPressed():
        _reset();
    }
  }

  void _increment() {
    final nextCount = state.count + 1;
    state = state.copyWith(count: nextCount, lastIntentLabel: 'increment');

    if (nextCount % 5 == 0) {
      _effects.add(CounterShowMessage('$nextCount reached'));
    }
  }

  void _decrement() {
    if (!state.canDecrement) {
      _effects.add(const CounterShowMessage('count is already zero'));
      return;
    }

    state = state.copyWith(
      count: state.count - 1,
      lastIntentLabel: 'decrement',
    );
  }

  void _reset() {
    if (state.count == 0) {
      _effects.add(const CounterShowMessage('nothing to reset'));
      return;
    }

    state = state.copyWith(count: 0, lastIntentLabel: 'reset');
    _effects.add(const CounterShowMessage('count reset'));
  }
}

@riverpod
Stream<CounterEffect> counterEffect(Ref ref) {
  return ref.watch(counterStoreProvider.notifier).effectStream;
}

class CounterMviPage extends ConsumerWidget {
  const CounterMviPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(counterEffectProvider, (previous, next) {
      switch (next) {
        case AsyncData(:final value):
          switch (value) {
            case CounterShowMessage(:final message):
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
          }
        case AsyncError():
        case AsyncLoading():
      }
    });

    final state = ref.watch(counterStoreProvider);
    final store = ref.read(counterStoreProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter MVI')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${state.count}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text('last intent: ${state.lastIntentLabel}'),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                IconButton.filled(
                  tooltip: 'decrement',
                  onPressed: () {
                    store.dispatch(const CounterDecrementPressed());
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton.filled(
                  tooltip: 'increment',
                  onPressed: () {
                    store.dispatch(const CounterIncrementPressed());
                  },
                  icon: const Icon(Icons.add),
                ),
                FilledButton(
                  onPressed: () {
                    store.dispatch(const CounterResetPressed());
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
