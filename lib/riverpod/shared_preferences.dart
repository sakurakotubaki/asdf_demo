import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as secure_storage;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart' as shared_prefs;

part 'shared_preferences.g.dart';

abstract interface class StorageCodec<T extends Object> {
  const StorageCodec();

  String encode(T value);

  T decode(String value);
}

final class StringStorageCodec extends StorageCodec<String> {
  const StringStorageCodec();

  @override
  String encode(String value) => value;

  @override
  String decode(String value) => value;
}

final class IntStorageCodec extends StorageCodec<int> {
  const IntStorageCodec();

  @override
  String encode(int value) => value.toString();

  @override
  int decode(String value) => int.parse(value);
}

final class DoubleStorageCodec extends StorageCodec<double> {
  const DoubleStorageCodec();

  @override
  String encode(double value) => value.toString();

  @override
  double decode(String value) => double.parse(value);
}

final class BoolStorageCodec extends StorageCodec<bool> {
  const BoolStorageCodec();

  @override
  String encode(bool value) => value.toString();

  @override
  bool decode(String value) {
    return switch (value) {
      'true' => true,
      'false' => false,
      _ => throw FormatException('Invalid bool value', value),
    };
  }
}

final class StorageKey<T extends Object> {
  const StorageKey(this.name, this.codec);

  final String name;
  final StorageCodec<T> codec;
}

abstract interface class TypedStorage {
  Future<T?> read<T extends Object>(StorageKey<T> key);

  Future<void> write<T extends Object>(StorageKey<T> key, T value);

  Future<void> delete<T extends Object>(StorageKey<T> key);
}

final class SharedPreferencesTypedStorage implements TypedStorage {
  SharedPreferencesTypedStorage({
    shared_prefs.SharedPreferencesAsync? preferences,
  }) : _preferences = preferences ?? shared_prefs.SharedPreferencesAsync();

  final shared_prefs.SharedPreferencesAsync _preferences;

  @override
  Future<T?> read<T extends Object>(StorageKey<T> key) async {
    final value = await _preferences.getString(key.name);
    if (value == null) {
      return null;
    }

    return key.codec.decode(value);
  }

  @override
  Future<void> write<T extends Object>(StorageKey<T> key, T value) {
    return _preferences.setString(key.name, key.codec.encode(value));
  }

  @override
  Future<void> delete<T extends Object>(StorageKey<T> key) {
    return _preferences.remove(key.name);
  }
}

final class SecureTypedStorage implements TypedStorage {
  SecureTypedStorage({secure_storage.FlutterSecureStorage? storage})
    : _storage = storage ?? const secure_storage.FlutterSecureStorage();

  final secure_storage.FlutterSecureStorage _storage;

  @override
  Future<T?> read<T extends Object>(StorageKey<T> key) async {
    final value = await _storage.read(key: key.name);
    if (value == null) {
      return null;
    }

    return key.codec.decode(value);
  }

  @override
  Future<void> write<T extends Object>(StorageKey<T> key, T value) {
    return _storage.write(key: key.name, value: key.codec.encode(value));
  }

  @override
  Future<void> delete<T extends Object>(StorageKey<T> key) {
    return _storage.delete(key: key.name);
  }
}

final class StorageKeys {
  const StorageKeys._();

  static const launchCount = StorageKey<int>('launch_count', IntStorageCodec());

  static const isOnboardingDone = StorageKey<bool>(
    'is_onboarding_done',
    BoolStorageCodec(),
  );

  static const userName = StorageKey<String>('user_name', StringStorageCodec());
}

@riverpod
TypedStorage typedStorage(Ref ref) {
  return SharedPreferencesTypedStorage();
}

@riverpod
TypedStorage secureTypedStorage(
  Ref ref, {
  String? storageNamespace,
  String? preferencesKeyPrefix,
  bool enforceBiometrics = false,
  bool migrateWithBackup = false,
  String? biometricPromptTitle,
  String? biometricPromptSubtitle,
}) {
  final androidOptions = enforceBiometrics
      ? secure_storage.AndroidOptions.biometric(
          enforceBiometrics: enforceBiometrics,
          migrateWithBackup: migrateWithBackup,
          preferencesKeyPrefix: preferencesKeyPrefix,
          storageNamespace: storageNamespace,
          biometricPromptTitle: biometricPromptTitle,
          biometricPromptSubtitle: biometricPromptSubtitle,
        )
      : secure_storage.AndroidOptions(
          enforceBiometrics: enforceBiometrics,
          migrateWithBackup: migrateWithBackup,
          preferencesKeyPrefix: preferencesKeyPrefix,
          storageNamespace: storageNamespace,
          biometricPromptTitle: biometricPromptTitle,
          biometricPromptSubtitle: biometricPromptSubtitle,
        );

  return SecureTypedStorage(
    storage: secure_storage.FlutterSecureStorage(aOptions: androidOptions),
  );
}
