import 'package:beer_catalogue_flutter/domain/models/ingredient.dart';

class Ingredients {
  final List<Ingredient> malt;
  final List<Ingredient> hops;

  Ingredients({
    required this.malt,
    required this.hops,
  });
}
