class UserModel {
  UserModel(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.login,
      this.dob,
      this.registered,
      this.phone,
      this.cell,
      this.id,
      this.picture,
      this.nat});

  UserModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'] ?? "";
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    email = json['email'];
    login = json['login'] != null ? Login.fromJson(json['login']) : null;
    dob = json['dob'] != null ? Dob.fromJson(json['dob']) : null;
    registered =
        json['registered'] != null ? Dob.fromJson(json['registered']) : null;
    phone = json['phone'] ?? "";
    cell = json['cell'] ?? "";
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    nat = json['nat'];
  }

  String? cell;
  Dob? dob;
  String? email;
  String? gender;
  Id? id;
  Location? location;
  Login? login;
  Name? name;
  String? nat;
  String? phone;
  Picture? picture;
  Dob? registered;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['email'] = email;
    if (login != null) {
      data['login'] = login!.toJson();
    }
    if (dob != null) {
      data['dob'] = dob!.toJson();
    }
    if (registered != null) {
      data['registered'] = registered!.toJson();
    }
    data['phone'] = phone;
    data['cell'] = cell;
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    data['nat'] = nat;
    return data;
  }
}

class Name {
  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    first = json['first'] ?? "";
    last = json['last'] ?? "";
  }

  String? first;
  String? last;
  String? title;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Location {
  Location(
      {this.street,
      this.city,
      this.state,
      this.country,
      this.postcode,
      this.coordinates,
      this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street = json['street'] != null ? Street.fromJson(json['street']) : null;
    city = json['city'] ?? "";
    state = json['state'] ?? "";
    country = json['country'] ?? "";
    postcode = json['postcode']?.toString() ?? "0";
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
    timezone =
        json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
  }

  String? city;
  Coordinates? coordinates;
  String? country;
  String? postcode;
  String? state;
  Street? street;
  Timezone? timezone;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (street != null) {
      data['street'] = street!.toJson();
    }
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postcode'] = postcode;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    if (timezone != null) {
      data['timezone'] = timezone!.toJson();
    }
    return data;
  }
}

class Street {
  Street({this.number, this.name});

  Street.fromJson(Map<String, dynamic> json) {
    number = (json['number'] as num?)?.toInt() ?? 0;
    name = json['name'] ?? "";
  }

  String? name;
  int? number;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    return data;
  }
}

class Coordinates {
  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'] ?? "";
    longitude = json['longitude'] ?? "";
  }

  String? latitude;
  String? longitude;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Timezone {
  Timezone({this.offset, this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    offset = json['offset'] ?? "";
    description = json['description'] ?? "";
  }

  String? description;
  String? offset;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['description'] = description;
    return data;
  }
}

class Login {
  Login(
      {this.uuid,
      this.username,
      this.password,
      this.salt,
      this.md5,
      this.sha1,
      this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'] ?? "";
    username = json['username'] ?? "";
    password = json['password'] ?? "";
    salt = json['salt'] ?? "";
    md5 = json['md5'] ?? "";
    sha1 = json['sha1'] ?? "";
    sha256 = json['sha256'] ?? "";
  }

  String? md5;
  String? password;
  String? salt;
  String? sha1;
  String? sha256;
  String? username;
  String? uuid;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['username'] = username;
    data['password'] = password;
    data['salt'] = salt;
    data['md5'] = md5;
    data['sha1'] = sha1;
    data['sha256'] = sha256;
    return data;
  }
}

class Dob {
  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'] ?? "";
    age = (json['age'] as num?)?.toInt() ?? 0;
  }

  int? age;
  String? date;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['age'] = age;
    return data;
  }
}

class Id {
  Id({this.name, this.value});

  Id.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    value = json['value'] ?? "";
  }

  String? name;
  String? value;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class Picture {
  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'] ?? "";
    medium = json['medium'] ?? "";
    thumbnail = json['thumbnail'] ?? "";
  }

  String? large;
  String? medium;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
