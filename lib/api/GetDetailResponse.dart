/// data_berita : {"id_berita":"45","judul":"Festival Agustus Merdeka Meriah, Bupati Wonogiri Foto Bareng Penonton   ","tanggal":"2022-08-04","kategori":"Sport","isi":null,"gambar":"1659664682.png"}
/// response : 200
/// message : "data ditemukan"

class GetDetailResponse {
  GetDetailResponse({
      DataBerita? dataBerita, 
      int? response, 
      String? message,}){
    _dataBerita = dataBerita;
    _response = response;
    _message = message;
}

  GetDetailResponse.fromJson(dynamic json) {
    _dataBerita = json['data_berita'] != null ? DataBerita.fromJson(json['data_berita']) : null;
    _response = json['response'];
    _message = json['message'];
  }
  DataBerita? _dataBerita;
  int? _response;
  String? _message;
GetDetailResponse copyWith({  DataBerita? dataBerita,
  int? response,
  String? message,
}) => GetDetailResponse(  dataBerita: dataBerita ?? _dataBerita,
  response: response ?? _response,
  message: message ?? _message,
);
  DataBerita? get dataBerita => _dataBerita;
  int? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataBerita != null) {
      map['data_berita'] = _dataBerita?.toJson();
    }
    map['response'] = _response;
    map['message'] = _message;
    return map;
  }

}

/// id_berita : "45"
/// judul : "Festival Agustus Merdeka Meriah, Bupati Wonogiri Foto Bareng Penonton   "
/// tanggal : "2022-08-04"
/// kategori : "Sport"
/// isi : null
/// gambar : "1659664682.png"

class DataBerita {
  DataBerita({
      String? idBerita, 
      String? judul, 
      String? tanggal, 
      String? kategori, 
      dynamic isi, 
      String? gambar,}){
    _idBerita = idBerita;
    _judul = judul;
    _tanggal = tanggal;
    _kategori = kategori;
    _isi = isi;
    _gambar = gambar;
}

  DataBerita.fromJson(dynamic json) {
    _idBerita = json['id_berita'];
    _judul = json['judul'];
    _tanggal = json['tanggal'];
    _kategori = json['kategori'];
    _isi = json['isi'];
    _gambar = json['gambar'];
  }
  String? _idBerita;
  String? _judul;
  String? _tanggal;
  String? _kategori;
  dynamic _isi;
  String? _gambar;
DataBerita copyWith({  String? idBerita,
  String? judul,
  String? tanggal,
  String? kategori,
  dynamic isi,
  String? gambar,
}) => DataBerita(  idBerita: idBerita ?? _idBerita,
  judul: judul ?? _judul,
  tanggal: tanggal ?? _tanggal,
  kategori: kategori ?? _kategori,
  isi: isi ?? _isi,
  gambar: gambar ?? _gambar,
);
  String? get idBerita => _idBerita;
  String? get judul => _judul;
  String? get tanggal => _tanggal;
  String? get kategori => _kategori;
  dynamic get isi => _isi;
  String? get gambar => _gambar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_berita'] = _idBerita;
    map['judul'] = _judul;
    map['tanggal'] = _tanggal;
    map['kategori'] = _kategori;
    map['isi'] = _isi;
    map['gambar'] = _gambar;
    return map;
  }

}