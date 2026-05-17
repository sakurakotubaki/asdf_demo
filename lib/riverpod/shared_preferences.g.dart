// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(typedStorage)
final typedStorageProvider = TypedStorageProvider._();

final class TypedStorageProvider
    extends $FunctionalProvider<TypedStorage, TypedStorage, TypedStorage>
    with $Provider<TypedStorage> {
  TypedStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'typedStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$typedStorageHash();

  @$internal
  @override
  $ProviderElement<TypedStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TypedStorage create(Ref ref) {
    return typedStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TypedStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TypedStorage>(value),
    );
  }
}

String _$typedStorageHash() => r'65e62a545b1e02216c15e5e5da938c29c7930bac';
