import 'package:flutter/material.dart';
import 'package:portal_berita/api/GetDetailResponse.dart';
import '../api/api.dart';
import 'package:portal_berita/constants.dart';


class DetailScreen extends StatefulWidget {
  final String idBerita;

  const DetailScreen({Key? key, required this.idBerita}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DataBerita data = DataBerita();

  getDetail() {
    Api.getDetailBerita(widget.idBerita).then((value) {
      setState(() {
        data = value.dataBerita!;
      });
    });
  }

  @override
  void initState() {
    getDetail();
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
        actions: [
          IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.indigo,
                size: 28,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                data.tanggal ?? "",
                style: Constants.paragraph,
                textAlign: TextAlign.center,
              ),
              Text(
                data.judul ?? "",
                style: Constants.heading2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                Api.IMG_URL + (data.gambar ?? ""),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
                errorBuilder: (context, object, stackTrace) {
                  print("LINKGAMBAR"+Api.IMG_URL + data.gambar!);
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
                data.isi ?? "",
                style: Constants.paragraph2,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
