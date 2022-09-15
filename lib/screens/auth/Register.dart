import 'package:portal_berita/api/api.dart';
import 'package:portal_berita/constants.dart';
import '../utils/alerts.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();

  bool invisible = true;
  bool invisible2 = true;

  register(BuildContext context) {
    var email = controllerEmail.text;
    var password = controllerPassword.text;
    var username = controllerUsername.text;
    var confirmPassword = controllerConfirmPassword.text;
    //validasi
    if (email == "") {
      Alerts.showMessage("Please enter your email", context);
      return;
    }
    if (password == "") {
      Alerts.showMessage("Please enter your password", context);
      return;
    }
    if (username == "") {
      Alerts.showMessage("Please enter your username", context);
      return;
    }
    if (confirmPassword == "") {
      Alerts.showMessage("Please enter your confirm password", context);
      return;
    }

    if (confirmPassword != password) {
      Alerts.showMessage(
          "You confirm password is not matched with your current password",
          context);
      return;
    }
    var data = {
    "email": email,
    "username": username,
    "password": password,
    };


    Api.submitRegister(data).then((value) {
      //jika register berhasil maka muncul pesan berhasil
      Alerts.showMessage(value.message!, context);
      Navigator.of(context).pop();
    }).catchError((error) {
      //jika register gagal,maka muncul pesan error
      Alerts.showMessage(error, context);
    });
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
              'Create Account',
              style: Constants.subTitle,
            ),
            Text(
              'Sign up to continue',
              style: Constants.title,
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
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controllerUsername,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: 'Username',),
              ),
            ),
            SizedBox(height: 10,),
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
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controllerConfirmPassword,
                obscureText: invisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      BorderSide(width: 0, style: BorderStyle.none)),
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon((invisible2 == true)
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        invisible2 = !invisible2;
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
                  register(context);
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                child:
                Text(
                  'Sign up',
                  style: Constants.heading1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
