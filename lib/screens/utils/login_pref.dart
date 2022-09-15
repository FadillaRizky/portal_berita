import 'package:shared_preferences/shared_preferences.dart';

import 'data_user.dart';

class LoginPref {
  static Future<bool> saveToSharedPref(String idUser, String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("id_user", idUser);
    pref.setString("username", username);
    return true;
  }

  //cek apakah user memiliki preference sengan key "id_user"
  static Future<bool> checkPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //jika ada maka bernilai true, jika tidak maka bernilai false
    bool status = pref.containsKey("id_user");

    return status;
  }
  //cara untuk mengambil nilai pref
  static Future <DataUser> getPref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    DataUser dataUser = DataUser();
    dataUser.idUser = pref.getString("id_user");
    dataUser.username = pref.getString("username");
    return dataUser;
  }
  static Future<bool> removePref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    return true;
  }
}
