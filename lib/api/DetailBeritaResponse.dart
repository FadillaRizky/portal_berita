/// result : {"id_berita":"2","judul":"Mampir Yuk! 5 Kafe Baru di Yogyakarta Ini Jadi Tempat Nongkrong Hits","gambar":"Mampir_Yuk!_5_Kafe_Baru_di_Yogyakarta_Ini_Jadi_Tempat_Nongkrong_Hits-1658717765.png","isi_berita":"Menoewa KopiMenoewa Kopi ini merupakan kafe milik musisi Tri Suaka. Foto: Instagram @menoewakopi.jogjaMenoewa Kopi ini merupakan kafe milik musisi Tri Suaka. Lokasinya berada di kawasan Depok, Sleman, Yogyakarta. Kafe hits yang satu ini mengusung konsep outdoor.Mampir di kafe ini bisa menikmati makanan sambil menyaksikan live music. Bahkan Tri Suaka sendiri sering tampil di live music tersebut. Untuk menunya, kamu bisa pesan Chicken Rice Bowl Black Pepper (Rp 17.000).Ayam bumbu blackpeppernya empuk dan pemberian bumbunya melimpah. Selain itu juga disajikan sayuran. Untuk minumannya kamu bisa pesan Es Kopi Menoewa (Rp 14.000) yang jadi andalan di sini.Menoewa KopiDepok, Kledokan, CaturtunggalTelepon: 0813-9262-4357","tanggal":"2022-07-25 04:56:05"}
/// message : "Data ada"
/// status_code : 200

class DetailBeritaResponse {
  DetailBeritaResponse({
      Result? result, 
      String? message, 
      int? statusCode,}){
    _result = result;
    _message = message;
    _statusCode = statusCode;
}

  DetailBeritaResponse.fromJson(dynamic json) {
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _message = json['message'];
    _statusCode = json['status_code'];
  }
  Result? _result;
  String? _message;
  int? _statusCode;
DetailBeritaResponse copyWith({  Result? result,
  String? message,
  int? statusCode,
}) => DetailBeritaResponse(  result: result ?? _result,
  message: message ?? _message,
  statusCode: statusCode ?? _statusCode,
);
  Result? get result => _result;
  String? get message => _message;
  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['message'] = _message;
    map['status_code'] = _statusCode;
    return map;
  }

}

/// id_berita : "2"
/// judul : "Mampir Yuk! 5 Kafe Baru di Yogyakarta Ini Jadi Tempat Nongkrong Hits"
/// gambar : "Mampir_Yuk!_5_Kafe_Baru_di_Yogyakarta_Ini_Jadi_Tempat_Nongkrong_Hits-1658717765.png"
/// isi_berita : "Menoewa KopiMenoewa Kopi ini merupakan kafe milik musisi Tri Suaka. Foto: Instagram @menoewakopi.jogjaMenoewa Kopi ini merupakan kafe milik musisi Tri Suaka. Lokasinya berada di kawasan Depok, Sleman, Yogyakarta. Kafe hits yang satu ini mengusung konsep outdoor.Mampir di kafe ini bisa menikmati makanan sambil menyaksikan live music. Bahkan Tri Suaka sendiri sering tampil di live music tersebut. Untuk menunya, kamu bisa pesan Chicken Rice Bowl Black Pepper (Rp 17.000).Ayam bumbu blackpeppernya empuk dan pemberian bumbunya melimpah. Selain itu juga disajikan sayuran. Untuk minumannya kamu bisa pesan Es Kopi Menoewa (Rp 14.000) yang jadi andalan di sini.Menoewa KopiDepok, Kledokan, CaturtunggalTelepon: 0813-9262-4357"
/// tanggal : "2022-07-25 04:56:05"

class Result {
  Result({
      String? idBerita, 
      String? judul, 
      String? gambar, 
      String? isiBerita, 
      String? tanggal,}){
    _idBerita = idBerita;
    _judul = judul;
    _gambar = gambar;
    _isiBerita = isiBerita;
    _tanggal = tanggal;
}

  Result.fromJson(dynamic json) {
    _idBerita = json['id_berita'];
    _judul = json['judul'];
    _gambar = json['gambar'];
    _isiBerita = json['isi_berita'];
    _tanggal = json['tanggal'];
  }
  String? _idBerita;
  String? _judul;
  String? _gambar;
  String? _isiBerita;
  String? _tanggal;
Result copyWith({  String? idBerita,
  String? judul,
  String? gambar,
  String? isiBerita,
  String? tanggal,
}) => Result(  idBerita: idBerita ?? _idBerita,
  judul: judul ?? _judul,
  gambar: gambar ?? _gambar,
  isiBerita: isiBerita ?? _isiBerita,
  tanggal: tanggal ?? _tanggal,
);
  String? get idBerita => _idBerita;
  String? get judul => _judul;
  String? get gambar => _gambar;
  String? get isiBerita => _isiBerita;
  String? get tanggal => _tanggal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_berita'] = _idBerita;
    map['judul'] = _judul;
    map['gambar'] = _gambar;
    map['isi_berita'] = _isiBerita;
    map['tanggal'] = _tanggal;
    return map;
  }

}