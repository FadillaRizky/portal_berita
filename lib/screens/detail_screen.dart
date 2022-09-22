import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:portal_berita/api/GetDetailProfileResponse.dart';
import 'package:portal_berita/api/GetDetailResponse.dart';
import 'package:portal_berita/screens/profile_screen.dart';
import 'package:portal_berita/screens/utils/alerts.dart';
import 'package:portal_berita/screens/utils/login_pref.dart';
import '../api/GetCommentResponse.dart';
import '../api/api.dart';
import 'package:portal_berita/constants.dart';

import 'auth/Login.dart';

class DetailScreen extends StatefulWidget {
  final String idBerita;

  const DetailScreen({Key? key, required this.idBerita,}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<GetDetailProfileResponse>? getProfile;
  TextEditingController commentController = TextEditingController();
  Future refresh() async {
    setState(() {
      getDataDetailBerita();
    });
  }


  getDataDetailBerita(){
    listDetailBerita = Api.getDetailBerita(widget.idBerita);
    getComment = Api.getComment(widget.idBerita);
  }

  Future<GetCommentResponse>? getComment;


  SubmitComment() async {
    LoginPref.checkPref().then((value) {
      if (value == false) {
        Alerts.showMessage("Login dulu cuyy..", context);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }

      if (formKey.currentState!.validate()) {
        // print(commentController.text);
        // setState(() {
        //   var value = {
        //     'name': ,
        //     'pic': "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
        //     'komentar': commentController.text
        //   };
        //   filedata.insert(0, value);
        // });

        FocusScope.of(context).unfocus();
      } else {
        print("Not validated");
      }
    });
    var dataUser = await LoginPref.getPref();
    var komen = {
      "id_berita": widget.idBerita,
      "id_user": dataUser.idUser.toString(),
      "komentar": commentController.text
    };
    print(komen);
    Api.submitKomen(komen).then((value) {
      Alerts.showMessage(value.message!, context);
    }).catchError((error) {
      //jika register gagal,maka muncul pesan error
      Alerts.showMessage(error, context);
    });
    commentController.clear();
  }

  final formKey = GlobalKey<FormState>();


  List filedata = [
  ];


  Future<GetDetailResponse>? listDetailBerita;

  @override
  void initState() {
    getDataDetailBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.indigo),
        title: Text(
          "Breaking News",
          style: Constants.heading4,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
          future: listDetailBerita,
          builder: (context, AsyncSnapshot<GetDetailResponse> snapshot) {
            if (snapshot.hasData) {
              return showDetail(snapshot.data!.dataBerita!);
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Image.asset("assets/images/emoticon.png"),
                  Text("Something Wrong ${snapshot.error}"),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),

    );
  }

//DataBerita adalah nama class di GetDetailResponse
  ListView showDetail(DataBerita dataBerita) {
    return ListView(
        physics: BouncingScrollPhysics(),
        children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              dataBerita.tanggal ?? "",
              style: Constants.paragraph,
              textAlign: TextAlign.center,
            ),
            Text(
              dataBerita.judul ?? "",
              style: Constants.heading2,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            Image.network(
              Api.IMG_URL + (dataBerita.gambar ?? ""),
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
              errorBuilder: (context, object, stackTrace) {
                // print("LINKGAMBAR" + Api.IMG_URL + dataBerita.gambar!);
                return Image.network(
                  "https://wolper.com.au/wp-content/uploads/2017/10/image-placeholder.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 300,
                );
              },
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              dataBerita.isi ?? "",
              style: Constants.paragraph2,
            ),
            Text("Komentar", style: Constants.heading2,),
            SizedBox(
              height: 300,
              child: CommentBox(
                userImage: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
                child: commentChild(),
                labelText: 'Write a comment...',
                withBorder: true,
                errorText: 'Comment cannot be blank',
                sendButtonMethod: () {
                  setState(() {
                    SubmitComment();
                     print(commentController.text);
                    return;
                  });
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
                sendWidget: Icon(
                    Icons.send_sharp, size: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget commentChild() {
    return FutureBuilder(
      future: getComment,
      builder: (context, AsyncSnapshot<GetCommentResponse>snapshot) {
        if (snapshot.hasData) {
          return showComment(snapshot.data!.data!);
        }
        if (snapshot.hasError) {
          return Center(
              child: Text("Something went wrong : ${snapshot.error}"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  ListView showComment(List<Data> comments) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () async {
                // Display the image in large form.
                print("Comment Clicked");
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage( Api.IMG_URL + "profile_user/"+
                        comments[index].profilepicture ??
                            "https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png")),
              ),
            ),
            title: Text(
              comments[index].username!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(comments[index].komentar!),
            trailing: Text(comments[index].tanggal!),
          ),
        );
      },


    );
  }
}

