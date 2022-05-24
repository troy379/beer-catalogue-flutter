// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientsRemote _$IngredientsRemoteFromJson(Map<String, dynamic> json) =>
    IngredientsRemote(
      malt: (json['malt'] as List<dynamic>)
          .map((e) => IngredientRemote.fromJson(e as Map<String, dynamic>))
          .toList(),
      hops: (json['hops'] as List<dynamic>)
          .map((e) => IngredientRemote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngredientsRemoteToJson(IngredientsRemote instance) =>
    <String, dynamic>{
      'malt': instance.malt,
      'hops': instance.hops,
    };
