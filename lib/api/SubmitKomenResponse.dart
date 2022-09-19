/// status : 200
/// message : "Komentar berhasil ditambahkan"

class SubmitKomenResponse {
  SubmitKomenResponse({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  SubmitKomenResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
SubmitKomenResponse copyWith({  num? status,
  String? message,
}) => SubmitKomenResponse(  status: status ?? _status,
  message: message ?? _message,
);
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}