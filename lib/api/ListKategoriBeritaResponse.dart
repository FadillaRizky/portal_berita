/// data_kategori : [{"kode_kategori":"1001","kategori":"Kuliner"},{"kode_kategori":"1002","kategori":"Olahraga"},{"kode_kategori":"1003","kategori":"Pendidikan"},{"kode_kategori":"1004","kategori":"Politik"},{"kode_kategori":"1007","kategori":"Hiburan"}]
/// response : 200
/// message : "data ditemukan"

class ListKategoriBeritaResponse {
  ListKategoriBeritaResponse({
      List<DataKategori>? dataKategori, 
      int? response, 
      String? message,}){
    _dataKategori = dataKategori;
    _response = response;
    _message = message;
}

  ListKategoriBeritaResponse.fromJson(dynamic json) {
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
ListKategoriBeritaResponse copyWith({  List<DataKategori>? dataKategori,
  int? response,
  String? message,
}) => ListKategoriBeritaResponse(  dataKategori: dataKategori ?? _dataKategori,
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

/// kode_kategori : "1001"
/// kategori : "Kuliner"

class DataKategori {
  DataKategori({
      String? kodeKategori, 
      String? kategori,}){
    _kodeKategori = kodeKategori;
    _kategori = kategori;
}

  DataKategori.fromJson(dynamic json) {
    _kodeKategori = json['kode_kategori'];
    _kategori = json['kategori'];
  }
  String? _kodeKategori;
  String? _kategori;
DataKategori copyWith({  String? kodeKategori,
  String? kategori,
}) => DataKategori(  kodeKategori: kodeKategori ?? _kodeKategori,
  kategori: kategori ?? _kategori,
);
  String? get kodeKategori => _kodeKategori;
  String? get kategori => _kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kode_kategori'] = _kodeKategori;
    map['kategori'] = _kategori;
    return map;
  }

}