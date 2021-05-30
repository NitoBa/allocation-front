abstract class ILocalStorage {
  Future<void> insert<R>(String key, dynamic value);
  Future<T> getItem<T>(String key);
  Future<void> clearAll();
}
