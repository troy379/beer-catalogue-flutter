import 'package:beer_catalogue_flutter/data/models/ingredients_remote.dart';
import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'beer_remote.g.dart';

@JsonSerializable()
class BeerRemote {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "tagline")
  final String? tagline;

  @JsonKey(name: "abv")
  final double abv;

  @JsonKey(name: "image_url")
  final String? imageUrl;

  @JsonKey(name: "description")
  final String? description;

  @JsonKey(name: "food_pairing")
  final List<String>? suitableSnacks;

  @JsonKey(name: "brewers_tips")
  final String? brewersTips;

  @JsonKey(name: "ingredients")
  final IngredientsRemote ingredients;

  const BeerRemote({
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

  factory BeerRemote.fromJson(Map<String, dynamic> json) => _$BeerRemoteFromJson(json);

  Beer toDomain() {
    return Beer(
      id: id.toString(),
      name: name,
      tagline: tagline,
      abv: abv,
      imageUrl: imageUrl,
      description: description,
      suitableSnacks: suitableSnacks ?? [],
      brewersTips: brewersTips,
      ingredients: ingredients.toDomain(),
    );
  }
}
