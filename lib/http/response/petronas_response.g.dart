// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petronas_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetronasResponse _$PetronasResponseFromJson(Map<String, dynamic> json) =>
    PetronasResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => PetronasData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['message'] as String?,
      json['error'] as String?,
    );

Map<String, dynamic> _$PetronasResponseToJson(PetronasResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'results': instance.results,
    };
