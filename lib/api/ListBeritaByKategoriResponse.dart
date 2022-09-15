/// data_kategori : [{"id_berita":"52","judul":"Kuliner Khas Wonogiri","tanggal":"2022-09-04","kategori":"Kuliner","isi":"asdjaksjdkajsdh asdasdhkasjdhkajd","gambar":"contoh.png"}]
/// response : 200
/// message : "data ditemukan"

class ListBeritaByKategoriResponse {
  ListBeritaByKategoriResponse({
      List<DataKategori>? dataKategori, 
      int? response, 
      String? message,}){
    _dataKategori = dataKategori;
    _response = response;
    _message = message;
}

  ListBeritaByKategoriResponse.fromJson(dynamic json) {
    if (json['data_kategori'] != null) {
      _dataKategori = [];
      json['data_kategori'].forEach((v) {
        _dataKategori?.add(DataKategori.fromJson(v));
      });
    }
    _response = json['response'];
    _message = json['message'];
  }
  List<DataKategori>? _dataKategori;
  int? _response;
  String? _message;
ListBeritaByKategoriResponse copyWith({  List<DataKategori>? dataKategori,
  int? response,
  String? message,
}) => ListBeritaByKategoriResponse(  dataKategori: dataKategori ?? _dataKategori,
  response: response ?? _response,
  message: message ?? _message,
);
  List<DataKategori>? get dataKategori => _dataKategori;
  int? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataKategori != null) {
      map['data_kategori'] = _dataKategori?.map((v) => v.toJson()).toList();
    }
    map['response'] = _response;
    map['message'] = _message;
    return map;
  }

}

/// id_berita : "52"
/// judul : "Kuliner Khas Wonogiri"
/// tanggal : "2022-09-04"
/// kategori : "Kuliner"
/// isi : "asdjaksjdkajsdh asdasdhkasjdhkajd"
/// gambar : "contoh.png"

class DataKategori {
  DataKategori({
      String? idBerita, 
      String? judul, 
      String? tanggal, 
      String? kategori, 
      String? isi, 
      String? gambar,}){
    _idBerita = idBerita;
    _judul = judul;
    _tanggal = tanggal;
    _kategori = kategori;
    _isi = isi;
    _gambar = gambar;
}

  DataKategori.fromJson(dynamic json) {
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
  String? _isi;
  String? _gambar;
DataKategori copyWith({  String? idBerita,
  String? judul,
  String? tanggal,
  String? kategori,
  String? isi,
  String? gambar,
}) => DataKategori(  idBerita: idBerita ?? _idBerita,
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
  String? get isi => _isi;
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