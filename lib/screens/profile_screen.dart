import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:portal_berita/constants.dart';
import 'package:portal_berita/screens/utils/login_pref.dart';

class ProfileScreen extends StatefulWidget {

  static String photo = "https://instagram.fcgk6-2.fna.fbcdn.net/v/t51.2885-19/294589443_1474258339675546_1246384686459467222_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcgk6-2.fna.fbcdn.net&_nc_cat=110&_nc_ohc=ro-LUPvIubwAX_PdrjY&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT8ufttJ3j7V7lCwjZOwBj-stQbnCkf1b-jm7gWT24ymFQ&oe=6328CB20&_nc_sid=8fd12b";
  static String name = "Fadillarizky294";
  static String email = "Fadillarizky294@gmail.com";

  const ProfileScreen({

    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var image;

  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 210,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      print(res);
                      if (res != null) {
                        print(res.map((e) => e.path).toList());
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
                              decoration: BoxDecoration(
                                  color: Colors.red[200]),
                                child: path != null ?
                                Image.file(image, height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,)


                                    : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red[200]),
                                  width: 200,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),)
                        ),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: Icon(Icons.add, size: 40,
                            color: Colors.indigo,),
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  ProfileScreen.name,
                  style: Constants.heading3,
                ),
                Text(
                  ProfileScreen.email,
                  style: Constants.subTitle,
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
        ),
      ),
    );
  }
}
