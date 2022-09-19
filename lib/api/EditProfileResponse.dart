/// status : 200
/// message : "edit profile berhasil, No image"

class EditProfileResponse {
  EditProfileResponse({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  EditProfileResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
EditProfileResponse copyWith({  num? status,
  String? message,
}) => EditProfileResponse(  status: status ?? _status,
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