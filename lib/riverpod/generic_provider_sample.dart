import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generic_provider_sample.g.dart';

@riverpod
List<T> numberPair<T extends num>(Ref ref, T first, T second) {
  return <T>[first, second];
}

@riverpod
String typedLabel<T extends Object>(Ref ref, T value) {
  return '$T: $value';
}

@riverpod
String genericSampleSummary(Ref ref) {
  final intPair = ref.watch(numberPairProvider<int>(1, 2));
  final doublePair = ref.watch(numberPairProvider<double>(1.5, 2.5));
  final stringLabel = ref.watch(typedLabelProvider<String>('Riverpod'));

  return [
    'int pair: $intPair',
    'double pair: $doublePair',
    'label: $stringLabel',
  ].join('\n');
}

class GenericProviderSamplePage extends ConsumerWidget {
  const GenericProviderSamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intPair = ref.watch(numberPairProvider<int>(10, 20));
    final doublePair = ref.watch(numberPairProvider<double>(1.25, 2.5));
    final intLabel = ref.watch(typedLabelProvider<int>(intPair.length));
    final summary = ref.watch(genericSampleSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Riverpod Generics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('int: $intPair'),
            Text('double: $doublePair'),
            Text('typed label: $intLabel'),
            const SizedBox(height: 16),
            Text(summary),
          ],
        ),
      ),
    );
  }
}
