import 'package:flutter/material.dart';
import 'package:portal_berita/screens/berita_screen.dart';
import 'package:portal_berita/screens/home.dart';

import 'package:portal_berita/screens/splash_screen.dart';

void main() {
  runApp(PortalBerita());
}

class PortalBerita extends StatelessWidget {
  const PortalBerita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portal Berita",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
