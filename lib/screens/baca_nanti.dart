import 'package:flutter/material.dart';
import 'package:portal_berita/api/GetDetailResponse.dart';
import 'package:portal_berita/api/ReadLaterResponse.dart';
import 'package:portal_berita/screens/auth/Login.dart';
import 'package:portal_berita/screens/utils/alerts.dart';
import 'package:portal_berita/screens/utils/login_pref.dart';

import '../api/ReadLaterResponse.dart';
import '../api/api.dart';
import '../constants.dart';
import 'detail_screen.dart';
import 'utils/data_user.dart';

class BacaNanti extends StatefulWidget {
  // final String idUser;
  const BacaNanti({
    Key? key,
  }) : super(key: key);

  @override
  State<BacaNanti> createState() => _BacaNantiState();
}

class _BacaNantiState extends State<BacaNanti> {
  Future<ReadLaterResponse> listReadLater() async {
    DataUser dataUser = await LoginPref.getPref();

    return Api.getReadLater(dataUser.idUser!);
  }

  checkLoginStatus() {
    LoginPref.checkPref().then((value) {
      if (value == false) {
        Alerts.showMessage("Login dulu cuyy..", context);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Baca Nanti",
          style: Constants.heading4,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: listReadLater(),
            builder: (context, AsyncSnapshot<ReadLaterResponse> snapshot) {
              if (snapshot.hasData) {
                // print(snapshot.data!.dataReadLater?.map((e) => "${e.idBerita} ${e.judul}"));
                return showReadLater(snapshot.data!.dataReadLater!);
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something wrong ${snapshot.error}"),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  Expanded showReadLater(List<DataReadLater> readLater) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: readLater.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    idBerita: readLater[index].idBerita!,
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
                      Api.IMG_URL + readLater[index].gambar!,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (context, obj, stackTrace) {
                        return Image.asset("assets/images/place_holder.jpeg");
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
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(readLater[index].tanggal!,
                              style: Constants.paragraph1,
                              textAlign: TextAlign.start),
                          Text(
                            readLater[index].judul!,
                            style: Constants.heading1,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
