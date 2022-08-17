import 'package:flutter/material.dart';
import 'package:portal_berita/screens/berita_screen.dart';
import 'package:portal_berita/screens/lifestyle.dart';
import 'package:portal_berita/screens/politik.dart';
import 'package:portal_berita/screens/sport.dart';
import 'package:portal_berita/screens/videos_screen.dart';

import '../constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.indigo,
                    size: 33,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://instagram.fjog3-1.fna.fbcdn.net/v/t51.2885-19/294589443_1474258339675546_1246384686459467222_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjog3-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=QX3OdpTJVscAX_5aEjg&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT8qci6S4rGkuQjgIKV1FJd-Rlrd7hW90TTBcU0RDQFFlA&oe=62E58EA0&_nc_sid=8fd12b'),
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
                Tab(text: "OlahRaga"),
                Tab(text: "GayaHidup"),
                Tab(text: "Politik"),
                Tab(text: "Video"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BeritaScreen(),
              SportScreen(),
              PolitikScreen(),
              LifeStyleScreen(),
              GaleriYoutube()
            ],
          ),
          drawer: Drawer(
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: Text(
                      'Hi, Fadillarizky !',
                      style: Constants.subTitle,
                    ),
                    subtitle: Text('fadillarizky294@gmail.com'),
                    leading: SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://instagram.fjog3-1.fna.fbcdn.net/v/t51.2885-19/294589443_1474258339675546_1246384686459467222_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjog3-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=QX3OdpTJVscAX_5aEjg&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT8qci6S4rGkuQjgIKV1FJd-Rlrd7hW90TTBcU0RDQFFlA&oe=62E58EA0&_nc_sid=8fd12b'),
                      ),
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
                  ),
                  Container(
                    color: Colors.black12,
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      'Pengaturan',
                      style: Constants.subTitle,
                    ),
                  ),
                  ListItem(title: 'Pengaturan Minat Untukmu'),
                  ListItem(
                    title: 'Notifikasi',
                  ),
                  ListItem(
                    title: 'Ukuran Font Baca',
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
                  ),
                  ListItem(title: 'Keluar')
                ],
              ),
            ),
          )),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;

  const ListItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: (){},
    );
  }
}
