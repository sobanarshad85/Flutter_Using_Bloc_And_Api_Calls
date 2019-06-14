class ItemModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

class Users {
  List<User> _users = [];

  List<User> get users => _users;

  Users.fromJson(Map<String, dynamic> usersjson) {
    List<User> temp = [];
    for (int i = 0; i < 9; i++) {
      User result = User(usersjson[i]);
      temp.add(result);
    }
    _users = temp;
  }
}

class User {
  int _id;
  String _name;
  String _username;
  String _email;
  String _phone;
  String _website;
  Address _address;
  Company _company;

  int get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get phone => _phone;
  String get website => _website;
  Address get address => _address;
  Company get company => _company;

  User(parsedUser) {
    _id = parsedUser["id"];
    _name = parsedUser["name"];
    _username = parsedUser["username"];
    _email = parsedUser["email"];
    _phone = parsedUser["phone"];
    _website = parsedUser["website"];
    _address = Address.fromJson(parsedUser["address"]);
    _company = Company.fromJson(parsedUser["company"]);
  }

  User.fromJson(Map<String, dynamic> parsedUser) {
    _id = parsedUser["id"];
    _name = parsedUser["name"];
    _username = parsedUser["username"];
    _email = parsedUser["email"];
    _phone = parsedUser["phone"];
    _website = parsedUser["website"];
    _address = Address.fromJson(parsedUser["address"]);
    _company = Company.fromJson(parsedUser["company"]);
  }
}

class Address {
  String _street;
  String _suite;
  String _city;
  String _zipcode;
  Geo _geo;

  String get street => _street;
  String get suite => _suite;
  String get city => _city;
  String get zipcode => _zipcode;
  Geo get geo => _geo;

  Address.fromJson(Map<String, dynamic> parsedAddress) {
    _street = parsedAddress["street"];
    _suite = parsedAddress["suite"];
    _city = parsedAddress["city"];
    _zipcode = parsedAddress["zipcode"];
    _geo = Geo.fromJson(parsedAddress["geo"]);
  }
}

class Geo {
  String _lat;
  String _lng;

  String get lat => _lat;
  String get lng => _lng;

  Geo.fromJson(Map<String, dynamic> parsedGeo) {
    _lat = parsedGeo["lat"];
    _lng = parsedGeo["lng"];
  }
}

class Company {
  String _name;
  String _catchPhrase;
  String _bs;

  String get name => _name;
  String get catchPhrase => _catchPhrase;
  String get bs => _bs;

  Company.fromJson(Map<String, dynamic> parsedCompany) {
    _name = parsedCompany["name"];
    _catchPhrase = parsedCompany["catchPhrase"];
    _bs = parsedCompany["bs"];
  }
}

class _Result {
  int _vote_count;
  int _id;
  bool _video;
  String _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;

  _Result(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'].toString();
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  String get release_date => _release_date;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title;

  String get original_language => _original_language;

  String get poster_path => _poster_path;

  double get popularity => _popularity;

  String get title => _title;

  String get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _vote_count;
}
