import 'shared_preferences_entity.dart';
import 'shared_preferences_provider.dart';

class SharedPreferencesEntityStorage {
  final SharedPreferencesProvider? _preferencesProvider;

  SharedPreferencesEntityStorage(this._preferencesProvider);

  Future<void> save<T>(T newValue, SharedPreferencesEntity<T> sharedPreferencesEntity) =>
      _preferencesProvider!.save(sharedPreferencesEntity.key, newValue);

  Future<T> get<T>(SharedPreferencesEntity<T> sharedPreferencesEntity) =>
      _preferencesProvider!.get(sharedPreferencesEntity.key, sharedPreferencesEntity.defaultValue);

  Future<void> remove(SharedPreferencesEntity sharedPreferencesEntity) =>
      _preferencesProvider!.remove(sharedPreferencesEntity.key);
}
