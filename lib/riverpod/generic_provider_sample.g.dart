// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_provider_sample.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 内容は、numberPairProvider<int>(...) / numberPairProvider<double>(...) のように
/// watch 時に型引数を渡すサンプルです。Ref は Riverpod 3 系の統一 API として直接使っています。

@ProviderFor(numberPair)
final numberPairProvider = NumberPairFamily._();

/// 内容は、numberPairProvider<int>(...) / numberPairProvider<double>(...) のように
/// watch 時に型引数を渡すサンプルです。Ref は Riverpod 3 系の統一 API として直接使っています。

final class NumberPairProvider<T extends num>
    extends $FunctionalProvider<List<T>, List<T>, List<T>>
    with $Provider<List<T>> {
  /// 内容は、numberPairProvider<int>(...) / numberPairProvider<double>(...) のように
  /// watch 時に型引数を渡すサンプルです。Ref は Riverpod 3 系の統一 API として直接使っています。
  NumberPairProvider._({
    required NumberPairFamily super.from,
    required (T, T) super.argument,
  }) : super(
         retry: null,
         name: r'numberPairProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$numberPairHash();

  @override
  String toString() {
    return r'numberPairProvider'
        '<${T}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<T> create(Ref ref) {
    final argument = this.argument as (T, T);
    return numberPair<T>(ref, argument.$1, argument.$2);
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
    return other is NumberPairProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$numberPairHash() => r'6d46cf74dd950d2c4d807cefa30516572effd3d8';

/// 内容は、numberPairProvider<int>(...) / numberPairProvider<double>(...) のように
/// watch 時に型引数を渡すサンプルです。Ref は Riverpod 3 系の統一 API として直接使っています。

final class NumberPairFamily extends $Family {
  NumberPairFamily._()
    : super(
        retry: null,
        name: r'numberPairProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 内容は、numberPairProvider<int>(...) / numberPairProvider<double>(...) のように
  /// watch 時に型引数を渡すサンプルです。Ref は Riverpod 3 系の統一 API として直接使っています。

  NumberPairProvider<T> call<T extends num>(T first, T second) =>
      NumberPairProvider<T>._(argument: (first, second), from: this);

  @override
  String toString() => r'numberPairProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    List<T> Function<T extends num>(Ref ref, (T, T) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as NumberPairProvider;
      return provider._captureGenerics(<T extends num>() {
        provider as NumberPairProvider<T>;
        final argument = provider.argument as (T, T);
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

@ProviderFor(typedLabel)
final typedLabelProvider = TypedLabelFamily._();

final class TypedLabelProvider<T extends Object>
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  TypedLabelProvider._({
    required TypedLabelFamily super.from,
    required T super.argument,
  }) : super(
         retry: null,
         name: r'typedLabelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$typedLabelHash();

  @override
  String toString() {
    return r'typedLabelProvider'
        '<${T}>'
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    final argument = this.argument as T;
    return typedLabel<T>(ref, argument);
  }

  $R _captureGenerics<$R>($R Function<T extends Object>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TypedLabelProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$typedLabelHash() => r'a4ba89303a6d3cb6f8f4b57dffa69a78d83b8548';

final class TypedLabelFamily extends $Family {
  TypedLabelFamily._()
    : super(
        retry: null,
        name: r'typedLabelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TypedLabelProvider<T> call<T extends Object>(T value) =>
      TypedLabelProvider<T>._(argument: value, from: this);

  @override
  String toString() => r'typedLabelProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    String Function<T extends Object>(Ref ref, T args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as TypedLabelProvider;
      return provider._captureGenerics(<T extends Object>() {
        provider as TypedLabelProvider<T>;
        final argument = provider.argument as T;
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

@ProviderFor(genericSampleSummary)
final genericSampleSummaryProvider = GenericSampleSummaryProvider._();

final class GenericSampleSummaryProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  GenericSampleSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'genericSampleSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$genericSampleSummaryHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return genericSampleSummary(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$genericSampleSummaryHash() =>
    r'602893577dc51b53dc4c56807b98aff6e8f30ff3';
