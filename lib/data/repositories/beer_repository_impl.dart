import 'package:beer_catalogue_flutter/data/local/favorite_beer_local_storage.dart';
import 'package:beer_catalogue_flutter/data/models/beer_remote.dart';
import 'package:beer_catalogue_flutter/data/network/punk_api_dio_client.dart';
import 'package:beer_catalogue_flutter/domain/exceptions/unexpected_exception.dart';
import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:beer_catalogue_flutter/domain/repositories/beer_repository.dart';

class BeerRepositoryImpl extends BeerRepository {
  final PunkApiDioClient _dioClient;
  final FavoriteBeerLocalStorage _favoriteBeerLocalStorage;

  BeerRepositoryImpl({
    required final PunkApiDioClient dioClient,
    required final FavoriteBeerLocalStorage favoriteBeerLocalStorage,
  })  : _dioClient = dioClient,
        _favoriteBeerLocalStorage = favoriteBeerLocalStorage;

  @override
  Future<List<Beer>> getBeers({required final int page}) async {
    try {
      final response = await _dioClient.dio.get(
        "beers",
        queryParameters: {
          "per_page": 50,
          "page": page,
        },
      );

      return (response.data as List<dynamic>).map((json) {
        return BeerRemote.fromJson(json).toDomain();
      }).toList();
    } catch (exception) {
      throw UnexpectedException(cause: exception);
    }
  }

  @override
  Future<Set<String>> getFavoriteBeerIds() async {
    return _favoriteBeerLocalStorage.getAllIds();
  }

  @override
  Future<bool> addFavoriteBeerId({required String beerId}) async {
    return _favoriteBeerLocalStorage.storeId(beerId);
  }

  @override
  Future<bool> removeFavoriteBeerId({required String beerId}) async {
    return _favoriteBeerLocalStorage.removeId(beerId);
  }
}
