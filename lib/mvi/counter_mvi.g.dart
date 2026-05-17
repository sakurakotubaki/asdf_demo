// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_mvi.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterStore)
final counterStoreProvider = CounterStoreProvider._();

final class CounterStoreProvider
    extends $NotifierProvider<CounterStore, CounterState> {
  CounterStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterStoreHash();

  @$internal
  @override
  CounterStore create() => CounterStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CounterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CounterState>(value),
    );
  }
}

String _$counterStoreHash() => r'3d75301948d703125744e6ce6adb7fbb252659bf';

abstract class _$CounterStore extends $Notifier<CounterState> {
  CounterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CounterState, CounterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CounterState, CounterState>,
              CounterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(counterEffect)
final counterEffectProvider = CounterEffectProvider._();

final class CounterEffectProvider
    extends
        $FunctionalProvider<
          AsyncValue<CounterEffect>,
          CounterEffect,
          Stream<CounterEffect>
        >
    with $FutureModifier<CounterEffect>, $StreamProvider<CounterEffect> {
  CounterEffectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterEffectProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterEffectHash();

  @$internal
  @override
  $StreamProviderElement<CounterEffect> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<CounterEffect> create(Ref ref) {
    return counterEffect(ref);
  }
}

String _$counterEffectHash() => r'4412ccc20c369822a7efc9b125893855fcccc25e';
