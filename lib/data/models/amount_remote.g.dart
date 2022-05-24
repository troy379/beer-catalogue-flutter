// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountRemote _$AmountRemoteFromJson(Map<String, dynamic> json) => AmountRemote(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$AmountRemoteToJson(AmountRemote instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };
