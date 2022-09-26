import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:portal_berita/api/api.dart';
import 'package:portal_berita/screens/utils/alerts.dart';
import 'package:portal_berita/screens/utils/login_pref.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isLoading = false;

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  var image;

  String? path;

  @override
  void initState() {
    LoginPref.getPref().then((value) {
      emailcontroller.text = value.email!;
      usernamecontroller.text = value.username!;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            (isLoading == true)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox(),
            Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: GestureDetector(
                    onTap: () async {
                      List<Media>? res = await ImagesPicker.pick(
                        count: 3,
                        pickType: PickType.all,
                        language: Language.English,
                        maxTime: 30,
                        // maxSize: 500,
                        cropOpt: CropOption(
                          // aspectRatio: CropAspectRatio.wh16x9,
                          cropType: CropType.circle,
                        ),
                      );
                      if (res != null) {
                        setState(() {
                          path = res[0].thumbPath;
                        });
                        setState(() {
                          image = File(path.toString());
                        });
                        // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
                        // print(status);
                      }
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.red[200]),
                              child: path != null
                                  ? Image.file(
                                image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                                  : Container(
                                decoration:
                                BoxDecoration(color: Colors.red[200]),
                                width: 200,
                                height: 200,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              ),
                            )),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.indigo,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      hintText: "Username...",
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: "Email...",
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });

                      applyUpdates();
                    },
                    child: Text("EDIT"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  applyUpdates() {
    String? base64Image;
    //konversi dari gambar ke base64
    if (path != null) {
      base64Image = base64Encode(File(path.toString()).readAsBytesSync());
    }

    LoginPref.getPref().then((value) {
      var data = {
        "username": usernamecontroller.text,
        "email": emailcontroller.text,
        //jika path nya tidak null,maka kasih kode base64,sebaliknya kasih nilai null
        "profileimage": (path != null) ? base64Image : "",
        "id_user": value.idUser
      };
      Api.submitEditProfile(data).then((value) async {
        setState(() {
          isLoading = false;
        });
        if (value.dataUser != null) {

          LoginPref.saveToSharedPref(
              value.dataUser!.idUser!,
              value.dataUser!.username!,
              value.dataUser!.email!,
              value.dataUser!.profilepicture!).then((value) {
            print("Save pref selesai======");
            // Alerts.showMessage(value.message!, context);
            Navigator.of(context).pop();
          });

        }else{
          print("Data user kosong======");
          Alerts.showMessage(value.message!, context);
          Navigator.of(context).pop();
        }
      });
    });
  }
}
