// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petronas_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetronasData _$PetronasDataFromJson(Map<String, dynamic> json) => PetronasData(
      json['icon'] as String?,
      json['name'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['vicinity'] as String?,
    );

Map<String, dynamic> _$PetronasDataToJson(PetronasData instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'rating': instance.rating,
      'vicinity': instance.vicinity,
    };
