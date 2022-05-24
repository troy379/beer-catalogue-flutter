import 'package:beer_catalogue_flutter/domain/repositories/beer_repository.dart';

class AddFavoriteBeerIdUseCase {
  final BeerRepository _beerRepository;

  const AddFavoriteBeerIdUseCase({
    required final BeerRepository beerRepository,
  }) : _beerRepository = beerRepository;

  Future<bool> execute({required final String beerId}) {
    return _beerRepository.addFavoriteBeerId(beerId: beerId);
  }
}
