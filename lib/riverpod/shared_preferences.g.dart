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

@ProviderFor(secureTypedStorage)
final secureTypedStorageProvider = SecureTypedStorageFamily._();

final class SecureTypedStorageProvider
    extends $FunctionalProvider<TypedStorage, TypedStorage, TypedStorage>
    with $Provider<TypedStorage> {
  SecureTypedStorageProvider._({
    required SecureTypedStorageFamily super.from,
    required ({
      String? storageNamespace,
      String? preferencesKeyPrefix,
      bool enforceBiometrics,
      bool migrateWithBackup,
      String? biometricPromptTitle,
      String? biometricPromptSubtitle,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'secureTypedStorageProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$secureTypedStorageHash();

  @override
  String toString() {
    return r'secureTypedStorageProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<TypedStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TypedStorage create(Ref ref) {
    final argument =
        this.argument
            as ({
              String? storageNamespace,
              String? preferencesKeyPrefix,
              bool enforceBiometrics,
              bool migrateWithBackup,
              String? biometricPromptTitle,
              String? biometricPromptSubtitle,
            });
    return secureTypedStorage(
      ref,
      storageNamespace: argument.storageNamespace,
      preferencesKeyPrefix: argument.preferencesKeyPrefix,
      enforceBiometrics: argument.enforceBiometrics,
      migrateWithBackup: argument.migrateWithBackup,
      biometricPromptTitle: argument.biometricPromptTitle,
      biometricPromptSubtitle: argument.biometricPromptSubtitle,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TypedStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TypedStorage>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SecureTypedStorageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$secureTypedStorageHash() =>
    r'c234bcc5ecda8e1561f3dfebc5e764193f1918b9';

final class SecureTypedStorageFamily extends $Family
    with
        $FunctionalFamilyOverride<
          TypedStorage,
          ({
            String? storageNamespace,
            String? preferencesKeyPrefix,
            bool enforceBiometrics,
            bool migrateWithBackup,
            String? biometricPromptTitle,
            String? biometricPromptSubtitle,
          })
        > {
  SecureTypedStorageFamily._()
    : super(
        retry: null,
        name: r'secureTypedStorageProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SecureTypedStorageProvider call({
    String? storageNamespace,
    String? preferencesKeyPrefix,
    bool enforceBiometrics = false,
    bool migrateWithBackup = false,
    String? biometricPromptTitle,
    String? biometricPromptSubtitle,
  }) => SecureTypedStorageProvider._(
    argument: (
      storageNamespace: storageNamespace,
      preferencesKeyPrefix: preferencesKeyPrefix,
      enforceBiometrics: enforceBiometrics,
      migrateWithBackup: migrateWithBackup,
      biometricPromptTitle: biometricPromptTitle,
      biometricPromptSubtitle: biometricPromptSubtitle,
    ),
    from: this,
  );

  @override
  String toString() => r'secureTypedStorageProvider';
}
