import 'package:flutter/material.dart';
import 'package:portal_berita/api/GetListBeritaResponse.dart';
import 'package:portal_berita/constants.dart';
import 'package:portal_berita/screens/detail_screen.dart';
import 'package:portal_berita/screens/utils/alerts.dart';
import 'package:portal_berita/screens/utils/login_pref.dart';
import '../api/api.dart';
import 'auth/Login.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  // buat variabel result untuk menampung data responsenya
  //untuk sementara , dibuat kosong dulu
  List<DataBerita> result = [];
  // untuk eksekusi apinya
  void getListBerita() {
    //then adalah kondisi dimana future melakukan callback setelah mendapatkan data response dari webservice
    Api.getListBerita().then((value) {
      setState(() {
        // isi variable result dengan data response
        result = value.dataBerita!;
      });
    });
  }

  submitReadLater(BuildContext context, String idBerita2) async {
    LoginPref.checkPref().then((value) {
      if (value == false) {
        Alerts.showMessage("Login dulu cuyy..", context);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }
    });
    var dataUser = await LoginPref.getPref();
    var idUser = dataUser.idUser!;
    var idBerita = idBerita2;

    //kelompokan data email dan password
    var data = {
      "id_user": idUser,
      "id_berita": idBerita,
    };

    Api.submitReadLater(data).then(
      (value) async {
        if (value.message == "data read later ditambahkan") {

        }
        Alerts.showMessage(value.message!, context);
      },
    );
  }

  @override
  void initState() {
    getListBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //
      // ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: result.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          idBerita: result[index].idBerita!, 
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            Api.IMG_URL + result[index].gambar!,
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                            errorBuilder: (context, obj, stackTrace) {
                              return Image.asset(
                                  "assets/images/place_holder.jpeg");
                            },
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment(0, 1),
                                colors: <Color>[
                                  Color(0x494949),
                                  Color(0xFF505050),
                                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          bottom: 7,
                          right: 5,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            width: deviceWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(result[index].tanggal!,
                                    style: Constants.paragraph1,
                                    textAlign: TextAlign.start),
                                Text(
                                  result[index].judul!,
                                  style: Constants.heading1,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 10,
                          child: IconButton(
                            onPressed: () {
                              setState(() {

                                submitReadLater(
                                  context,
                                  result[index].idBerita!,
                                );

                                return;
                              });
                            },
                            icon: Icon(Icons.bookmark_add,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
