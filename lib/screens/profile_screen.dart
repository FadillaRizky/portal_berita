import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:portal_berita/constants.dart';
import 'package:portal_berita/screens/auth/Login.dart';
import 'package:portal_berita/screens/utils/login_pref.dart';

import '../api/GetDetailProfileResponse.dart';
import '../api/api.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Future<GetDetailProfileResponse>? getProfile;
  String? idUser;

  Future checkLogin() async {
    var statuslogin = await LoginPref.checkPref();
    if (statuslogin == false) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    }
    var DataUser = await LoginPref.getPref();
    setState(() {
      idUser = DataUser.idUser;
    });
  }


  showDataProfile(){
    checkLogin().then((value) {
      getProfile = Api.getDetailProfile(idUser!);
    });
  }

  @override
  void initState() {
    showDataProfile();
    // checkLogin().then((value) {
    //   getProfile = Api.getDetailProfile(idUser!);
    // });

    super.initState();
  }

  var image;

  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: getProfile,
              builder:
                  (context, AsyncSnapshot<GetDetailProfileResponse> snapshot) {
                if (snapshot.hasData) {
                  return showProfile(context, snapshot.data!.dataUser!);
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Somethink wrong ${snapshot.error}"),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }

  Widget showProfile(BuildContext context, DataUser dataUser) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                      child: Image.network(
                    Api.IMG_URL + "profile_user/" + dataUser.profilepicture,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, obj, stacktrace) {
                      if (stacktrace == null) {
                        return obj;
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, obj, stacktrace) {
                      return Image.asset("assets/images/place_holder.jpeg");
                    },
                  ))),
            ),
            Text(
              dataUser.username!,
              style: Constants.heading3,
            ),
            Text(
              dataUser.email!,
              style: Constants.subTitle,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => EditProfile()))
                      .then((value) {
                    setState(() {
                      showDataProfile();
                    });
                  });
                },
                child: Text("Edit Profile"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  LoginPref.removePref().then((value) {
                    Navigator.of(context).pop();
                  });
                },
                child: Text("Log Out"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
