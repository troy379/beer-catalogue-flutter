import 'package:beer_catalogue_flutter/domain/models/ingredients.dart';

class Beer {
  final String id;
  final String name;
  final String? tagline;
  final double abv;
  final String? imageUrl;
  final String? description;
  final List<String> suitableSnacks;
  final String? brewersTips;
  final Ingredients ingredients;

  Beer({
    required this.id,
    required this.name,
    required this.tagline,
    required this.abv,
    required this.imageUrl,
    required this.description,
    required this.suitableSnacks,
    required this.brewersTips,
    required this.ingredients,
  });
}
