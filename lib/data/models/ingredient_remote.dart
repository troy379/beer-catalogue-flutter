import 'package:beer_catalogue_flutter/data/models/amount_remote.dart';
import 'package:beer_catalogue_flutter/domain/models/ingredient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_remote.g.dart';

@JsonSerializable()
class IngredientRemote {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "amount")
  final AmountRemote amount;

  const IngredientRemote({
    required this.name,
    required this.amount,
  });

  factory IngredientRemote.fromJson(Map<String, dynamic> json) => _$IngredientRemoteFromJson(json);

  Ingredient toDomain() {
    return Ingredient(
      name: name,
      amount: amount.toDomain(),
    );
  }
}
