import 'package:json_annotation/json_annotation.dart';
import "geo.dart";
part 'address.g.dart';

@JsonSerializable()
class Address {
    Address();

    String street;
    String suite;
    String city;
    String zipcode;
    Geo geo;
    
    factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
    Map<String, dynamic> toJson() => _$AddressToJson(this);
}
