/// data : [{"id_berita":"67","id_user":"2","id_komen":"4","username":"fadillarizky","profilepicture":null,"komentar":"berita nya anjayy","tanggal":"2022-09-08 00:00:00"},{"id_berita":"67","id_user":"2","id_komen":"2","username":"fadillarizky","profilepicture":null,"komentar":"lksldakjdlakdjlaksdjadas","tanggal":"2022-09-01 14:08:10"}]
/// response : 200
/// message : "Data ditemukan"

class GetCommentResponse {
  GetCommentResponse({
      List<Data>? data, 
      num? response, 
      String? message,}){
    _data = data;
    _response = response;
    _message = message;
}

  GetCommentResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _response = json['response'];
    _message = json['message'];
  }
  List<Data>? _data;
  num? _response;
  String? _message;
GetCommentResponse copyWith({  List<Data>? data,
  num? response,
  String? message,
}) => GetCommentResponse(  data: data ?? _data,
  response: response ?? _response,
  message: message ?? _message,
);
  List<Data>? get data => _data;
  num? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['response'] = _response;
    map['message'] = _message;
    return map;
  }

}

/// id_berita : "67"
/// id_user : "2"
/// id_komen : "4"
/// username : "fadillarizky"
/// profilepicture : null
/// komentar : "berita nya anjayy"
/// tanggal : "2022-09-08 00:00:00"

class Data {
  Data({
      String? idBerita, 
      String? idUser, 
      String? idKomen, 
      String? username, 
      dynamic profilepicture, 
      String? komentar, 
      String? tanggal,}){
    _idBerita = idBerita;
    _idUser = idUser;
    _idKomen = idKomen;
    _username = username;
    _profilepicture = profilepicture;
    _komentar = komentar;
    _tanggal = tanggal;
}

  Data.fromJson(dynamic json) {
    _idBerita = json['id_berita'];
    _idUser = json['id_user'];
    _idKomen = json['id_komen'];
    _username = json['username'];
    _profilepicture = json['profilepicture'];
    _komentar = json['komentar'];
    _tanggal = json['tanggal'];
  }
  String? _idBerita;
  String? _idUser;
  String? _idKomen;
  String? _username;
  dynamic _profilepicture;
  String? _komentar;
  String? _tanggal;
Data copyWith({  String? idBerita,
  String? idUser,
  String? idKomen,
  String? username,
  dynamic profilepicture,
  String? komentar,
  String? tanggal,
}) => Data(  idBerita: idBerita ?? _idBerita,
  idUser: idUser ?? _idUser,
  idKomen: idKomen ?? _idKomen,
  username: username ?? _username,
  profilepicture: profilepicture ?? _profilepicture,
  komentar: komentar ?? _komentar,
  tanggal: tanggal ?? _tanggal,
);
  String? get idBerita => _idBerita;
  String? get idUser => _idUser;
  String? get idKomen => _idKomen;
  String? get username => _username;
  dynamic get profilepicture => _profilepicture;
  String? get komentar => _komentar;
  String? get tanggal => _tanggal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_berita'] = _idBerita;
    map['id_user'] = _idUser;
    map['id_komen'] = _idKomen;
    map['username'] = _username;
    map['profilepicture'] = _profilepicture;
    map['komentar'] = _komentar;
    map['tanggal'] = _tanggal;
    return map;
  }

}