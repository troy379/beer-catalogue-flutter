import 'package:beer_catalogue_flutter/domain/models/beer.dart';

abstract class BeerRepository {
  Future<List<Beer>> getBeers({required final int page});

  Future<Set<String>> getFavoriteBeerIds();

  Future<bool> addFavoriteBeerId({required final String beerId});

  Future<bool> removeFavoriteBeerId({required final String beerId});
}
