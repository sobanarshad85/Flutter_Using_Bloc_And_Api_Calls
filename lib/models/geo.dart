import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable()
class Geo {
    Geo();

    String lat;
    String lng;
    
    factory Geo.fromJson(Map<String,dynamic> json) => _$GeoFromJson(json);
    Map<String, dynamic> toJson() => _$GeoToJson(this);
}
