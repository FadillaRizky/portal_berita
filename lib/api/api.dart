import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:portal_berita/api/GetDetailResponse.dart';
import 'package:portal_berita/api/GetListBeritaResponse.dart';
import 'package:portal_berita/api/ListBeritaByKategoriResponse.dart';
import 'package:portal_berita/api/ListKategoriBeritaResponse.dart';
import 'package:portal_berita/api/ReadLaterResponse.dart';
import 'package:portal_berita/api/SubmitReadLater.dart';

import 'GetCommentResponse.dart';
import 'auth/LoginResponse.dart';
import 'auth/RegisterResponse.dart';

// buat variabel konstanta dan global sebagai url api dasar
  //LOCAL_URL = "http://localhost/web_portal_berita/api";
// HOSTING_URL = "https://fadillarizky.enricko.com/api";
const BASE_URL = "http://192.168.18.18/web_portal_berita/api";

class Api {

  static String IMG_URL = "http://192.168.18.18/web_portal_berita/images/";
  // membuat function dengan keyword static
  // Future = mendapat nilai dimasa yang akan datang setelah melakukan request api
  // var response = untuk melakukan request kemudian menunggu (await) response dari webservice
  static Future<GetListBeritaResponse> getListBerita() async{
    var url = "$BASE_URL/get_list_berita.php";
    // print(url);
    var response = await http.get(Uri.parse(url));
    //jika response adalah 200
    if(response.statusCode == 200){
      //maka kembalikan data response
      return GetListBeritaResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request list berita:\n${response.body}";
  }
  static Future<GetDetailResponse> getDetailBerita(String idBerita) async{
    var url = "$BASE_URL/get_detail_berita.php?id=$idBerita";
    var response = await http.get(Uri.parse(url));
    //jika response adalah 200
    if(response.statusCode == 200){
      //maka kembalikan data response
      return GetDetailResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request detail berita:\n${response.body}";
  }
  static Future<ListKategoriBeritaResponse> getListKategoriBerita() async{
    var url = "$BASE_URL/get_kategori.php";
    // print(url);
    var response = await http.get(Uri.parse(url));
    //jika response adalah 200
    if(response.statusCode == 200){
      //maka kembalikan data response
      return ListKategoriBeritaResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request list Kategori Berita:\n${response.body}";
  }
  static Future<ListBeritaByKategoriResponse> getListBeritaByKategori(String kdKategori) async{
    var url = "$BASE_URL/get_berita_by_kategori.php?kdKategori=$kdKategori";
    // print(url);
    var response = await http.get(Uri.parse(url));
    //jika response adalah 200
    if(response.statusCode == 200){
      //maka kembalikan data response
      return ListBeritaByKategoriResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request list berita by Kategori:\n${response.body}";
  }
  static Future<LoginResponse> submitLogin(Map<String,String>dataUser) async {
    var url = BASE_URL + "/login_user.php";
// print(url);
    var response = await http.post(Uri.parse(url),body: dataUser);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "Unable to submit Login";
    }
  }
  static Future<LoginResponse> submitPicture(String picture) async {
    var url = BASE_URL + "";
// print(url);
    var response = await http.post(Uri.parse(url),body: picture);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "Unable to submit Picture";
    }
  }
  static Future<RegisterResponse> submitRegister(Map<String,String>dataUser) async {
    var url = BASE_URL + "/register_user.php";

    var response = await http.post(Uri.parse(url),body: dataUser);

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "Unable to submit Register";
    }
  }
  static Future<ReadLaterResponse> getReadLater(String idUser) async{
    var url = "$BASE_URL/get_read_later.php?idUser=$idUser";
    // print(url);
    var response = await http.get(Uri.parse(url));
    //jika response adalah 200
    if(response.statusCode == 200){
      //maka kembalikan data response
      return ReadLaterResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request read later:\n${response.body}";
  }
  static Future<SubmitReadLater> submitReadLater(Map<String,String>dataUser) async {
    var url = BASE_URL + "/submit_read_later.php";
// print(url);
    var response = await http.post(Uri.parse(url),body: dataUser);

    if (response.statusCode == 200) {
      return SubmitReadLater.fromJson(jsonDecode(response.body));
    } else {
      throw "Unable to submit read later";
    }
  }
  static Future<GetCommentResponse> getComment(String idBerita) async{
    var url = "$BASE_URL/get_comment.php?id_berita=$idBerita";
    // print(url);
    var response = await http.get(Uri.parse(url));
    //jika response adalah 200
    if(response.statusCode == 200){
      //maka kembalikan data response
      return GetCommentResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request komentar:\n${response.body}";
  }

}