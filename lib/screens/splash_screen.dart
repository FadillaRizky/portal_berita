import 'package:flutter/material.dart';
import 'package:portal_berita/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void delayed(BuildContext context)
  {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    delayed(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Image.asset(
            'assets/images/iconlauncher.png',
            height: 70,
            fit: BoxFit.cover,
          ),
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
