// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientRemote _$IngredientRemoteFromJson(Map<String, dynamic> json) =>
    IngredientRemote(
      name: json['name'] as String,
      amount: AmountRemote.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientRemoteToJson(IngredientRemote instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };
