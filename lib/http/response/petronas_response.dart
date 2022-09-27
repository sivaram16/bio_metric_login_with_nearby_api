import 'package:freelance_demo/http/model/petronas_data.dart';
import 'package:freelance_demo/http/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'petronas_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PetronasResponse extends BaseResponse {
  final List<PetronasData>? results;
  PetronasResponse(this.results, String? status, String? message, String? error)
      : super(status, message, error);
  factory PetronasResponse.fromJson(Map<String, dynamic> json) =>
      _$PetronasResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PetronasResponseToJson(this);
}
