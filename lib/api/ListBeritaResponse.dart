/// result : [{"id_berita":"3","judul":"Kompensasi Sapi PMK Sebesar Rp 10 Juta Segera Diberikan ","gambar":"KompensasiSapiPMKSebesarRp10JutaSegeraDiberikan-1658717539.png","tanggal":"2022-07-25"},{"id_berita":"2","judul":"Mampir Yuk! 5 Kafe Baru di Yogyakarta Ini Jadi Tempat Nongkrong Hits","gambar":"Mampir_Yuk!_5_Kafe_Baru_di_Yogyakarta_Ini_Jadi_Tempat_Nongkrong_Hits-1658717765.png","tanggal":"2022-07-25"}]
/// message : "Data ada"
/// status_code : 200

class ListBeritaResponse {
  ListBeritaResponse({
      List<Result>? result, 
      String? message, 
      int? statusCode,}){
    _result = result;
    _message = message;
    _statusCode = statusCode;
}

  ListBeritaResponse.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
    _message = json['message'];
    _statusCode = json['status_code'];
  }
  List<Result>? _result;
  String? _message;
  int? _statusCode;
ListBeritaResponse copyWith({  List<Result>? result,
  String? message,
  int? statusCode,
}) => ListBeritaResponse(  result: result ?? _result,
  message: message ?? _message,
  statusCode: statusCode ?? _statusCode,
);
  List<Result>? get result => _result;
  String? get message => _message;
  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status_code'] = _statusCode;
    return map;
  }

}

/// id_berita : "3"
/// judul : "Kompensasi Sapi PMK Sebesar Rp 10 Juta Segera Diberikan "
/// gambar : "KompensasiSapiPMKSebesarRp10JutaSegeraDiberikan-1658717539.png"
/// tanggal : "2022-07-25"

class Result {
  Result({
      String? idBerita, 
      String? judul, 
      String? gambar, 
      String? tanggal,}){
    _idBerita = idBerita;
    _judul = judul;
    _gambar = gambar;
    _tanggal = tanggal;
}

  Result.fromJson(dynamic json) {
    _idBerita = json['id_berita'];
    _judul = json['judul'];
    _gambar = json['gambar'];
    _tanggal = json['tanggal'];
  }
  String? _idBerita;
  String? _judul;
  String? _gambar;
  String? _tanggal;
Result copyWith({  String? idBerita,
  String? judul,
  String? gambar,
  String? tanggal,
}) => Result(  idBerita: idBerita ?? _idBerita,
  judul: judul ?? _judul,
  gambar: gambar ?? _gambar,
  tanggal: tanggal ?? _tanggal,
);
  String? get idBerita => _idBerita;
  String? get judul => _judul;
  String? get gambar => _gambar;
  String? get tanggal => _tanggal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_berita'] = _idBerita;
    map['judul'] = _judul;
    map['gambar'] = _gambar;
    map['tanggal'] = _tanggal;
    return map;
  }

}