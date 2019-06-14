import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
    Company();

    String name;
    String catchPhrase;
    String bs;
    
    factory Company.fromJson(Map<String,dynamic> json) => _$CompanyFromJson(json);
    Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
