/// data_berita : [{"id_berita":"45","judul":"Festival Agustus Merdeka Meriah, Bupati Wonogiri Foto Bareng Penonton   ","tanggal":"2022-08-04","kategori":"Sport","isi":null,"gambar":"1659664682.png"},{"id_berita":"46","judul":"Prakiraan Cuaca Wonogiri Hari Jumat Ini: Cerah Berawan sejak Pagi ","tanggal":"2022-08-05","kategori":"Politik","isi":"Cuaca di Kabupaten Wonogiri diperkirakan berlangsung cerah berawan sejak, Jumat (5/8/2022) pagi. Cuaca di Wonogiri diperkirakan mengalami berawan saat malam hari.\r\nPromosiBorong Penghargaan, Tokopedia Jadi Marketplace Favorit UMKM\r\nMulai pukul 04.00 WIB, cuaca berlangsung berawan dengan suhu 22 derajat celsius dan kecepatan angin 10 km/jam. Sedangkan kelembapan mencapai 95 persen.\r\nPukul 07.00 WIB, cuaca di Wonogiri cerah berawan dengan suhu 26 derajat celsius. Kecepatan angin 20 km/jam dan kelembapan 80 persen.\r\nPukul 10.00 WIB, cuaca diperkirakan cerah berawan dengan suhu 30 derajat celsius. Kecepatan angin 20 km/jam dan kelembapan 65 persen.\r\nMemasuki pukul 13.00 WIB, cuaca di Wonogiri berlangsung cerah berawan dengan suhu udara 33 derajat celsius. Kecepatan angin 20 km/jam dan kelembapan 60 persen.\r\nPada pukul 16.00 WIB, kondisi cuaca di Wonogiri mengalami cerah berawan. Suhu udara 30 derajat celsius. Sedangkan kecepatan angin 20 km/jam dan kelembapan udara 70 persen.\r\nPukul 19.00 WIB, cuaca di Wonogiri berlangsung berawan dengan suhu udara 28 derajat celsius. Kecepatan angin 10 km/jam dan kelembapan udara 75 persen.\r\nPukul 22.00 WIB, kondisi cuaca berawan dengan suhu udara 26 derajat celsius. Kecepatan angin 10 km/jam dan kelembapan udara 90 persen","gambar":"1659665563.png"}]
/// response : 200
/// message : "data ditemukan"

class GetListBeritaResponse {
  GetListBeritaResponse({
      List<DataBerita>? dataBerita, 
      int? response, 
      String? message,}){
    _dataBerita = dataBerita;
    _response = response;
    _message = message;
}

  GetListBeritaResponse.fromJson(dynamic json) {
    if (json['data_berita'] != null) {
      _dataBerita = [];
      json['data_berita'].forEach((v) {
        _dataBerita?.add(DataBerita.fromJson(v));
      });
    }
    _response = json['response'];
    _message = json['message'];
  }
  List<DataBerita>? _dataBerita;
  int? _response;
  String? _message;
GetListBeritaResponse copyWith({  List<DataBerita>? dataBerita,
  int? response,
  String? message,
}) => GetListBeritaResponse(  dataBerita: dataBerita ?? _dataBerita,
  response: response ?? _response,
  message: message ?? _message,
);
  List<DataBerita>? get dataBerita => _dataBerita;
  int? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataBerita != null) {
      map['data_berita'] = _dataBerita?.map((v) => v.toJson()).toList();
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