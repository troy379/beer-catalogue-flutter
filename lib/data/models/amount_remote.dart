import 'package:beer_catalogue_flutter/domain/models/amount.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amount_remote.g.dart';

@JsonSerializable()
class AmountRemote {
  @JsonKey(name: "value")
  final double value;

  @JsonKey(name: "unit")
  final String unit;

  const AmountRemote({
    required this.value,
    required this.unit,
  });

  factory AmountRemote.fromJson(Map<String, dynamic> json) => _$AmountRemoteFromJson(json);

  Amount toDomain() {
    return Amount(
      value: value,
      unit: unit,
    );
  }
}
