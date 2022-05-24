import 'package:beer_catalogue_flutter/domain/repositories/beer_repository.dart';

class GetFavoriteBeerIdsUseCase {
  final BeerRepository _beerRepository;

  const GetFavoriteBeerIdsUseCase({
    required final BeerRepository beerRepository,
  }) : _beerRepository = beerRepository;

  Future<Set<String>> execute() {
    return _beerRepository.getFavoriteBeerIds();
  }
}
