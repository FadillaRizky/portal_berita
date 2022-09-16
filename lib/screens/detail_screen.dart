import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
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
  Future<GetCommentResponse>? getComment;



  SubmitComment() async {
    LoginPref.checkPref().then((value) {
      if (value == false) {
        Alerts.showMessage("Login dulu cuyy..", context);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }
      if (formKey.currentState!.validate()) {
        print(commentController.text);
        setState(() {
          var value = {
            'name': ProfileScreen.name,
            'pic': ProfileScreen.photo,
            'message': commentController.text
          };
          filedata.insert(0, value);
        });
        commentController.clear();
        FocusScope.of(context).unfocus();
      } else {
        print("Not validated");
      }
    });
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  List filedata = [
  ];
  TextEditingController controllerkomen = TextEditingController();

  komen() {
    var komen = controllerkomen.text;
  }

  Future<GetDetailResponse>? listDetailBerita;

  @override
  void initState() {
    listDetailBerita = Api.getDetailBerita(widget.idBerita);
    getComment = Api.getComment(widget.idBerita);
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
      body: FutureBuilder(
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

    );
  }

//DataBerita adalah nama class di GetDetailResponse
  ListView showDetail(DataBerita dataBerita) {
    return ListView(children: [
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
                print("LINKGAMBAR" + Api.IMG_URL + dataBerita.gambar!);
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
                userImage:
                ProfileScreen.photo,
                child: commentChild(),
                labelText: 'Write a comment...',
                withBorder: false,
                errorText: 'Comment cannot be blank',
                sendButtonMethod: () {
                  setState(() {
                    SubmitComment();
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
      builder: (context,AsyncSnapshot<GetCommentResponse>snapshot) {
        if(snapshot.hasData){
          return showComment(snapshot.data!.data!);
        }
        if(snapshot.hasError){
          return Center(child: Text("Something went wrong : ${snapshot.error}"));
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
                    backgroundImage: NetworkImage(comments[index].profilepicture ?? "https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png")),
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

