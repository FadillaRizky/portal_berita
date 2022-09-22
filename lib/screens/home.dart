import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portal_berita/api/GetCommentResponse.dart';
import 'package:portal_berita/api/api.dart';
import 'package:portal_berita/api/auth/LoginResponse.dart';
import 'package:portal_berita/screens/baca_nanti.dart';
import 'package:portal_berita/screens/berita_screen.dart';
import 'package:portal_berita/screens/profile_screen.dart';
import 'package:portal_berita/screens/tentang_aplikasi.dart';
import 'package:portal_berita/screens/utils/alerts.dart';
import 'package:portal_berita/screens/utils/login_pref.dart';
import 'package:portal_berita/screens/videos_screen.dart';

import '../api/ListKategoriBeritaResponse.dart';
import '../constants.dart';
import 'home_widgets/subscreen_tabbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<ListKategoriBeritaResponse> dataKategori = Api.getListKategoriBerita();
  List<DataKategori> listKategori = [];

  DataUser dataUser = DataUser();

  getUserData(){
    LoginPref.checkPref().then((value) {
      if (value == true) {
        LoginPref.getPref().then((value) {
          setState((){
            dataUser = DataUser(
              idUser: value.idUser,
              username: value.username,
              email: value.email,
              profilepicture: value.profileimage,
            );
          });
          print("HOME : " + value.profileimage.toString());

        });
      }
      dataUser = DataUser();

    });
  }
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2 + listKategori.length,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.indigo),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Image.asset(
              'assets/images/newspaper.jpg',
              height: 30,
              fit: BoxFit.cover,
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen( ))).then((value){

                        getUserData();

                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage((dataUser.profilepicture != "null" && dataUser.profilepicture != null ) ? Api.IMG_URL + "profile_user/" + dataUser.profilepicture : "https://www.pngkey.com/png/full/349-3499617_person-placeholder-person-placeholder.png"),
                    ),
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 7,
              indicatorColor: Colors.indigo,
              labelColor: Colors.indigo,
              labelStyle: TextStyle(letterSpacing: 0.15, fontSize: 18),
              tabs: [
                Tab(
                  text: 'Terkini',
                ),
                for (var value in listKategori)
                  Tab(
                    text: value.kategori!,
                  ),
                Tab(text: "Video"),
              ],
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                children: [
                  BeritaScreen(),
                  for (var value in listKategori) SubScreenTabbar(value: value),
                  GaleriYoutube()
                ],
              ),
              FutureBuilder(
                future: dataKategori,
                builder: (context,
                    AsyncSnapshot<ListKategoriBeritaResponse> snapshot) {
                  if (snapshot.hasData) {
                    // ketika proses build sudah selesai,baru bisa d setstate()
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        listKategori = snapshot.data!.dataKategori!;
                      });
                    });

                    return SizedBox();
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
          drawer: Drawer(
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: Text(
                      dataUser.username ?? "Guest",
                      style: Constants.subTitle,
                    ),
                    subtitle: Text(dataUser.email ?? ""),
                    leading: SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                          backgroundImage:
                          NetworkImage((dataUser.profilepicture != "null" && dataUser.profilepicture != null ) ? Api.IMG_URL + "profile_user/" + dataUser.profilepicture : "https://www.pngkey.com/png/full/349-3499617_person-placeholder-person-placeholder.png"),),
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  Container(
                    color: Colors.black12,
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      'Aktivitas',
                      style: Constants.subTitle,
                    ),
                  ),
                  ListItem(
                    title: 'Baca Nanti',
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BacaNanti(),
                        ),
                      );
                    },
                  ),
                  Container(
                    color: Colors.black12,
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      'Bantuan dan Lainnya',
                      style: Constants.subTitle,
                    ),
                  ),
                  ListItem(
                    title: 'Tentang Aplikasi',
                    ontap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TentangApp()));
                    },
                  ),
                  ListItem(
                    title: 'Keluar',
                    ontap: () {
                      Alerts.showAlertYesNo(
                          title: "Keluar Aplikasi",
                          content: "Afakah anda yaqin??",
                          onPressYes: () {
                            exit(0);
                          },
                          onPressNo: () {
                            return Navigator.of(context).pop();
                          },
                          context: context);
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class ListItem extends StatelessWidget {
  final VoidCallback? ontap;
  final String title;

  const ListItem({
    Key? key,
    required this.title,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: ontap,
    );
  }
}
