import 'package:beer_catalogue_flutter/domain/models/amount.dart';

class Ingredient {
  final String name;
  final Amount amount;

  Ingredient({
    required this.name,
    required this.amount,
  });
}
