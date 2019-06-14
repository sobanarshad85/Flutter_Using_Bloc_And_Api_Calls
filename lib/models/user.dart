import 'package:json_annotation/json_annotation.dart';
import "address.dart";
import "company.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  num id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  String get name1 => name;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}



class SingleUser {
  final int userID;
  final String name;
  final String username;
  final String email;
  final Address address;

  SingleUser({this.userID, this.name, this.username, this.email, this.address});

  factory SingleUser.fromJson(Map<String, dynamic> usersjson) => SingleUser(
      userID: usersjson["id"],
      name: usersjson["name"],
      username: usersjson["username"],
      email: usersjson["email"],
      address: Address.fromJson(usersjson["address"]));
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({this.street, this.suite, this.city, this.zipcode});

  factory Address.fromJson(Map<String, dynamic> addjson) {
    return Address(
        street: addjson["street"],
        suite: addjson["suite"],
        city: addjson["city"],
        zipcode: addjson["zipcode"]);
  }
}
