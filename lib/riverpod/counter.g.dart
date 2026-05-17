// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(count)
final countProvider = CountProvider._();

final class CountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return count(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$countHash() => r'7a114d55cd15f66410bafc7ded48afca2ffdfc5a';

@ProviderFor(readCount)
final readCountProvider = ReadCountProvider._();

final class ReadCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  ReadCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'readCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$readCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return readCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$readCountHash() => r'ceadc6898adb08604b572356a616b4f0c2a81eb6';

@ProviderFor(calc)
final calcProvider = CalcFamily._();

final class CalcProvider<T extends num>
    extends $FunctionalProvider<List<T>, List<T>, List<T>>
    with $Provider<List<T>> {
  CalcProvider._({required CalcFamily super.from})
    : super(
        argument: null,
        retry: null,
        name: r'calcProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calcHash();

  @override
  String toString() {
    return r'calcProvider'
        '<${T}>'
        '()';
  }

  @$internal
  @override
  $ProviderElement<List<T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<T> create(Ref ref) {
    return calc<T>(ref);
  }

  $R _captureGenerics<$R>($R Function<T extends num>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<T> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<T>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CalcProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$calcHash() => r'c6901500ec57191f3132c34b8c850854a05f32cb';

final class CalcFamily extends $Family {
  CalcFamily._()
    : super(
        retry: null,
        name: r'calcProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CalcProvider<T> call<T extends num>() => CalcProvider<T>._(from: this);

  @override
  String toString() => r'calcProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(List<T> Function<T extends num>(Ref ref) create) =>
      $FamilyOverride(
        from: this,
        createElement: (pointer) {
          final provider = pointer.origin as CalcProvider;
          return provider._captureGenerics(<T extends num>() {
            provider as CalcProvider<T>;
            return provider.$view(create: create<T>).$createElement(pointer);
          });
        },
      );
}
