/// data_user : {"id_user":"6","username":"saya","email":"akusaya@gmail.com","profilepicture":null}
/// response : 200
/// message : "data ditemukan"

class GetDetailProfileResponse {
  GetDetailProfileResponse({
      DataUser? dataUser, 
      num? response, 
      String? message,}){
    _dataUser = dataUser;
    _response = response;
    _message = message;
}

  GetDetailProfileResponse.fromJson(dynamic json) {
    _dataUser = json['data_user'] != null ? DataUser.fromJson(json['data_user']) : null;
    _response = json['response'];
    _message = json['message'];
  }
  DataUser? _dataUser;
  num? _response;
  String? _message;
GetDetailProfileResponse copyWith({  DataUser? dataUser,
  num? response,
  String? message,
}) => GetDetailProfileResponse(  dataUser: dataUser ?? _dataUser,
  response: response ?? _response,
  message: message ?? _message,
);
  DataUser? get dataUser => _dataUser;
  num? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataUser != null) {
      map['data_user'] = _dataUser?.toJson();
    }
    map['response'] = _response;
    map['message'] = _message;
    return map;
  }

}

/// id_user : "6"
/// username : "saya"
/// email : "akusaya@gmail.com"
/// profilepicture : null

class DataUser {
  DataUser({
      String? idUser, 
      String? username, 
      String? email, 
      dynamic profilepicture,}){
    _idUser = idUser;
    _username = username;
    _email = email;
    _profilepicture = profilepicture;
}

  DataUser.fromJson(dynamic json) {
    _idUser = json['id_user'];
    _username = json['username'];
    _email = json['email'];
    _profilepicture = json['profilepicture'];
  }
  String? _idUser;
  String? _username;
  String? _email;
  dynamic _profilepicture;
DataUser copyWith({  String? idUser,
  String? username,
  String? email,
  dynamic profilepicture,
}) => DataUser(  idUser: idUser ?? _idUser,
  username: username ?? _username,
  email: email ?? _email,
  profilepicture: profilepicture ?? _profilepicture,
);
  String? get idUser => _idUser;
  String? get username => _username;
  String? get email => _email;
  dynamic get profilepicture => _profilepicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_user'] = _idUser;
    map['username'] = _username;
    map['email'] = _email;
    map['profilepicture'] = _profilepicture;
    return map;
  }

}