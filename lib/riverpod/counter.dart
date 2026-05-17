import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter.g.dart';

@riverpod
int count(Ref ref) {
  return 0;
}

@riverpod
int readCount(Ref ref) {
  return ref.watch(countProvider);
}

// Generics
@riverpod
List<T> calc<T extends num>(Ref ref) {
  return <T>[];
}

// int generics
List<T> intCalc<T extends num>(Ref ref) {
  return ref.watch(calcProvider());
}
