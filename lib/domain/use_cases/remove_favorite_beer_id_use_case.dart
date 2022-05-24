import 'package:beer_catalogue_flutter/domain/repositories/beer_repository.dart';

class RemoveFavoriteBeerIdUseCase {
  final BeerRepository _beerRepository;

  const RemoveFavoriteBeerIdUseCase({
    required final BeerRepository beerRepository,
  }) : _beerRepository = beerRepository;

  Future<bool> execute({required final String beerId}) {
    return _beerRepository.removeFavoriteBeerId(beerId: beerId);
  }
}
