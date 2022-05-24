// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeerRemote _$BeerRemoteFromJson(Map<String, dynamic> json) => BeerRemote(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String?,
      abv: (json['abv'] as num).toDouble(),
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String?,
      suitableSnacks: (json['food_pairing'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      brewersTips: json['brewers_tips'] as String?,
      ingredients: IngredientsRemote.fromJson(
          json['ingredients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeerRemoteToJson(BeerRemote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'abv': instance.abv,
      'image_url': instance.imageUrl,
      'description': instance.description,
      'food_pairing': instance.suitableSnacks,
      'brewers_tips': instance.brewersTips,
      'ingredients': instance.ingredients,
    };
