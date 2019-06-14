// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo()
    ..lat = json['lat'] as String
    ..lng = json['lng'] as String;
}

Map<String, dynamic> _$GeoToJson(Geo instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
