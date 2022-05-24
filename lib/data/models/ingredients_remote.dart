import 'package:beer_catalogue_flutter/data/models/ingredient_remote.dart';
import 'package:beer_catalogue_flutter/domain/models/ingredients.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredients_remote.g.dart';

@JsonSerializable()
class IngredientsRemote {
  @JsonKey(name: "malt")
  final List<IngredientRemote> malt;

  @JsonKey(name: "hops")
  final List<IngredientRemote> hops;

  const IngredientsRemote({
    required this.malt,
    required this.hops,
  });

  factory IngredientsRemote.fromJson(Map<String, dynamic> json) => _$IngredientsRemoteFromJson(json);

  Ingredients toDomain() {
    return Ingredients(
      malt: malt.map((ingredient) => ingredient.toDomain()).toList(growable: false),
      hops: hops.map((ingredient) => ingredient.toDomain()).toList(growable: false),
    );
  }
}
