import 'package:freelance_demo/utils/base_equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'petronas_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PetronasData extends BaseEquatable {
  final String? icon;
  final String? name;
  final double? rating;
  final String? vicinity;

  PetronasData(this.icon, this.name, this.rating, this.vicinity);

  factory PetronasData.fromJson(Map<String, dynamic> json) =>
      _$PetronasDataFromJson(json);

  Map<String, dynamic> toJson() => _$PetronasDataToJson(this);
}
