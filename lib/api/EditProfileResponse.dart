/// status : 200
/// data_user : {"id_user":"6","username":"enricko","email":"enrickosnjay@gmail.com","profilepicture":"043a542f-fb83-4186-ba0a-fb23c92bb5c6.png"}
/// message : "edit profile berhasil"

class EditProfileResponse {
  EditProfileResponse({
      int? status, 
      DataUser? dataUser, 
      String? message,}){
    _status = status;
    _dataUser = dataUser;
    _message = message;
}

  EditProfileResponse.fromJson(dynamic json) {
    _status = json['status'];
    _dataUser = json['data_user'] != null ? DataUser.fromJson(json['data_user']) : null;
    _message = json['message'];
  }
  int? _status;
  DataUser? _dataUser;
  String? _message;
EditProfileResponse copyWith({  int? status,
  DataUser? dataUser,
  String? message,
}) => EditProfileResponse(  status: status ?? _status,
  dataUser: dataUser ?? _dataUser,
  message: message ?? _message,
);
  int? get status => _status;
  DataUser? get dataUser => _dataUser;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_dataUser != null) {
      map['data_user'] = _dataUser?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// id_user : "6"
/// username : "enricko"
/// email : "enrickosnjay@gmail.com"
/// profilepicture : "043a542f-fb83-4186-ba0a-fb23c92bb5c6.png"

class DataUser {
  DataUser({
      String? idUser, 
      String? username, 
      String? email, 
      String? profilepicture,}){
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
  String? _profilepicture;
DataUser copyWith({  String? idUser,
  String? username,
  String? email,
  String? profilepicture,
}) => DataUser(  idUser: idUser ?? _idUser,
  username: username ?? _username,
  email: email ?? _email,
  profilepicture: profilepicture ?? _profilepicture,
);
  String? get idUser => _idUser;
  String? get username => _username;
  String? get email => _email;
  String? get profilepicture => _profilepicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_user'] = _idUser;
    map['username'] = _username;
    map['email'] = _email;
    map['profilepicture'] = _profilepicture;
    return map;
  }

}