/// data_user : {"id_user":"2","username":"fadillarizky","email":"fadillarizky294@gmail.com","password":"eeedb760af13ddc1fe2a5aa3041ce9a7"}
/// response : 200
/// message : "data ditemukan"

class LoginResponse {
  LoginResponse({
      DataUser? dataUser, 
      int? response, 
      String? message,}){
    _dataUser = dataUser;
    _response = response;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _dataUser = json['data_user'] != null ? DataUser.fromJson(json['data_user']) : null;
    _response = json['response'];
    _message = json['message'];
  }
  DataUser? _dataUser;
  int? _response;
  String? _message;
LoginResponse copyWith({  DataUser? dataUser,
  int? response,
  String? message,
}) => LoginResponse(  dataUser: dataUser ?? _dataUser,
  response: response ?? _response,
  message: message ?? _message,
);
  DataUser? get dataUser => _dataUser;
  int? get response => _response;
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

/// id_user : "2"
/// username : "fadillarizky"
/// email : "fadillarizky294@gmail.com"
/// password : "eeedb760af13ddc1fe2a5aa3041ce9a7"

class DataUser {
  DataUser({
      String? idUser, 
      String? username, 
      String? email, 
      String? password,}){
    _idUser = idUser;
    _username = username;
    _email = email;
    _password = password;
}

  DataUser.fromJson(dynamic json) {
    _idUser = json['id_user'];
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
  }
  String? _idUser;
  String? _username;
  String? _email;
  String? _password;
DataUser copyWith({  String? idUser,
  String? username,
  String? email,
  String? password,
}) => DataUser(  idUser: idUser ?? _idUser,
  username: username ?? _username,
  email: email ?? _email,
  password: password ?? _password,
);
  String? get idUser => _idUser;
  String? get username => _username;
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_user'] = _idUser;
    map['username'] = _username;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}