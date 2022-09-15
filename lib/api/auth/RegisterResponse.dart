/// status : 200
/// message : "register berhasil"

class RegisterResponse {
  RegisterResponse({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  RegisterResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;
RegisterResponse copyWith({  int? status,
  String? message,
}) => RegisterResponse(  status: status ?? _status,
  message: message ?? _message,
);
  int? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}