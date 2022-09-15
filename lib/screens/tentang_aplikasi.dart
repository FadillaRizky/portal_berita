import 'package:flutter/material.dart';
import 'package:portal_berita/constants.dart';

class TentangApp extends StatelessWidget {
  const TentangApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Image.asset(
                "assets/images/newspaper.jpg",
                height: 60,
                width: 200,
              ),
              SizedBox(height: 20,),
              Text(
                "Aplikasi Portal Berita yang bertujuan untuk memudahkan khalayak umum agar dapat mengakses informasi yang terupdate dan terpercaya.",
                style: TextStyle(fontSize: 19,color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 300,),
              Text("2.0.0 version")
            ],
          ),
        ),
      ),
    );
  }
}
