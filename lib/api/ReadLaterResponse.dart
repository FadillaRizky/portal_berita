/// data_read_later : [{"id_berita":"53","id_user":"2","username":"fadillarizky","judul":"Makanan Khas Wonogiri","gambar":"1662428234.png","tanggal":"2022-09-05"}]
/// response : 200
/// message : "data ditemukan"

class ReadLaterResponse {
  ReadLaterResponse({
      List<DataReadLater>? dataReadLater, 
      int? response, 
      String? message,}){
    _dataReadLater = dataReadLater;
    _response = response;
    _message = message;
}

  ReadLaterResponse.fromJson(dynamic json) {
    if (json['data_read_later'] != null) {
      _dataReadLater = [];
      json['data_read_later'].forEach((v) {
        _dataReadLater?.add(DataReadLater.fromJson(v));
      });
    }
    _response = json['response'];
    _message = json['message'];
  }
  List<DataReadLater>? _dataReadLater;
  int? _response;
  String? _message;
ReadLaterResponse copyWith({  List<DataReadLater>? dataReadLater,
  int? response,
  String? message,
}) => ReadLaterResponse(  dataReadLater: dataReadLater ?? _dataReadLater,
  response: response ?? _response,
  message: message ?? _message,
);
  List<DataReadLater>? get dataReadLater => _dataReadLater;
  int? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataReadLater != null) {
      map['data_read_later'] = _dataReadLater?.map((v) => v.toJson()).toList();
    }
    map['response'] = _response;
    map['message'] = _message;
    return map;
  }

}

/// id_berita : "53"
/// id_user : "2"
/// username : "fadillarizky"
/// judul : "Makanan Khas Wonogiri"
/// gambar : "1662428234.png"
/// tanggal : "2022-09-05"

class DataReadLater {
  DataReadLater({
      String? idBerita, 
      String? idUser, 
      String? username, 
      String? judul, 
      String? gambar, 
      String? tanggal,}){
    _idBerita = idBerita;
    _idUser = idUser;
    _username = username;
    _judul = judul;
    _gambar = gambar;
    _tanggal = tanggal;
}

  DataReadLater.fromJson(dynamic json) {
    _idBerita = json['id_berita'];
    _idUser = json['id_user'];
    _username = json['username'];
    _judul = json['judul'];
    _gambar = json['gambar'];
    _tanggal = json['tanggal'];
  }
  String? _idBerita;
  String? _idUser;
  String? _username;
  String? _judul;
  String? _gambar;
  String? _tanggal;
DataReadLater copyWith({  String? idBerita,
  String? idUser,
  String? username,
  String? judul,
  String? gambar,
  String? tanggal,
}) => DataReadLater(  idBerita: idBerita ?? _idBerita,
  idUser: idUser ?? _idUser,
  username: username ?? _username,
  judul: judul ?? _judul,
  gambar: gambar ?? _gambar,
  tanggal: tanggal ?? _tanggal,
);
  String? get idBerita => _idBerita;
  String? get idUser => _idUser;
  String? get username => _username;
  String? get judul => _judul;
  String? get gambar => _gambar;
  String? get tanggal => _tanggal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_berita'] = _idBerita;
    map['id_user'] = _idUser;
    map['username'] = _username;
    map['judul'] = _judul;
    map['gambar'] = _gambar;
    map['tanggal'] = _tanggal;
    return map;
  }

}