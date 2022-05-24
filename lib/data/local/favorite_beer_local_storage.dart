import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBeerLocalStorage {
  static const _keyFavoriteBeerIds = "FAVORITE_BEER_IDS";

  final SharedPreferences _sharedPreferences;

  FavoriteBeerLocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  Future<bool> storeId(String id) {
    final allIds = getAllIds();
    allIds.add(id);
    return _storeIdsList(allIds);
  }

  Future<bool> removeId(String id) {
    final allIds = getAllIds();
    allIds.removeWhere((existingId) => existingId == id);
    return _storeIdsList(allIds);
  }

  Set<String> getAllIds() {
    return _sharedPreferences.getStringList(_keyFavoriteBeerIds)?.toSet() ?? {};
  }

  Future<bool> _storeIdsList(Set<String> idsList) {
    return _sharedPreferences.setStringList(_keyFavoriteBeerIds, [
      ...{...idsList}
    ]);
  }
}
