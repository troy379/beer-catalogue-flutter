import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:beer_catalogue_flutter/domain/repositories/beer_repository.dart';

class GetBeersListUseCase {
  final BeerRepository _beerRepository;

  const GetBeersListUseCase({
    required final BeerRepository beerRepository,
  }) : _beerRepository = beerRepository;

  Future<List<Beer>> execute({required final int page}) {
    return _beerRepository.getBeers(page: page);
  }
}
