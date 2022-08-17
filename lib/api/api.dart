import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:portal_berita/api/DetailBeritaResponse.dart';
import 'package:portal_berita/api/GetDetailResponse.dart';
import 'package:portal_berita/api/GetListBeritaResponse.dart';
import 'package:portal_berita/api/ListBeritaResponse.dart' ;


import 'ListBeritaResponse.dart';

// buat variabel konstanta dan global sebagai url api dasar
const BASE_URL = "https://fadillarizky.enricko.com/api";

class Api {

  static String IMG_URL = "https://fadillarizky.enricko.com/images/";
  // membuat function dengan keyword static
  // Future = mendapat nilai dimasa yang akan datang setelah melakukan request api
  // var response = untuk melakukan request kemudian menunggu (await) response dari webservice
  static Future<GetListBeritaResponse> getListBerita() async{
    var url = "$BASE_URL/get_list_berita.php";
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
}