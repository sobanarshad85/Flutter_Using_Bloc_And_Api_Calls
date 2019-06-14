import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'users.g.dart';

@JsonSerializable()
class Users {
    Users();

    List<User> users;
    
    factory Users.fromJson(Map<String,dynamic> json) => _$UsersFromJson(json);
    Map<String, dynamic> toJson() => _$UsersToJson(this);
}
