import 'package:portal_berita/api/api.dart';
import 'package:portal_berita/constants.dart';
// import 'package:portal_berita/screens/auth/Register.dart';
import '../utils/login_pref.dart';
import 'package:flutter/material.dart';
import 'package:portal_berita/api/auth/LoginResponse.dart';

import '../utils/alerts.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool invisible = true;

  login(BuildContext context) {
    var email = controllerEmail.text;
    var password = controllerPassword.text;
    //validasi
    if (email.isEmpty) {
      Alerts.showMessage("Please Enter your email", context);
      return;
    }
    if (password.isEmpty) {
      Alerts.showMessage("Please enter your password", context);
      return;
    }

    //kelompokan data email dan password
    var data = {
      "email": email,
      "password": password,
    };

    Api.submitLogin(data).then((value) async {
        //ketika pesan nya bukan successful
        if (value.message != "data ditemukan") {
          //muncul error
          Alerts.showMessage(value.message!, context);
          return;
        }
        LoginPref.saveToSharedPref(
          value.dataUser!.idUser!,
          value.dataUser!.username!,
          value.dataUser!.email!,
        );

        //cek apakah pref yang sudah di save, benar benar tersimpan?
        if (await LoginPref.checkPref() == true) {
          Alerts.showMessage("Login Success!", context);
          //jika ya,maka kembali kehalaman semula
          Navigator.of(context).pop();

          //iduser dan username tampil di console
          // LoginPref.getPref().then((value) {
          //   print(value.idUser! + value.username!);
          // });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54)),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 100, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: Constants.subTitle,
            ),
            Text(
              'Sign in to continue',
              style: Constants.subTitle,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'Email Address',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controllerPassword,
                obscureText: invisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon((invisible == true)
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        invisible = !invisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  login(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
                child: Text(
                  'Sign in',
                  style: Constants.heading1,
                ),
              ),
            ),
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("Don't have an account? Create an account")))
          ],
        ),
      ),
    );
  }
}
