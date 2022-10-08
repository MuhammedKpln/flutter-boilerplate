// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Hive box names
enum StorageBoxes {
  auth('auth');

  final String box;
  const StorageBoxes(this.box);
}

/// Hive box names
enum AuthStorageKeys {
  user('user');

  final String key;
  const AuthStorageKeys(this.key);
}