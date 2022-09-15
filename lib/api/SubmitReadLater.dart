/// message : "data read later ditambahkan"

class SubmitReadLater {
  SubmitReadLater({
      String? message,}){
    _message = message;
}

  SubmitReadLater.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
SubmitReadLater copyWith({  String? message,
}) => SubmitReadLater(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}