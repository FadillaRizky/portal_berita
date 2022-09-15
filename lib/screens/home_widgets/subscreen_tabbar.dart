import 'package:flutter/material.dart';

import '../../api/ListBeritaByKategoriResponse.dart' as dataBerita;
import '../../api/ListKategoriBeritaResponse.dart' as dataKategori;
import '../../api/api.dart';
import '../../constants.dart';
import '../detail_screen.dart';

class SubScreenTabbar extends StatefulWidget {
  const SubScreenTabbar({
    Key? key,
    required this.value,
  }) : super(key: key);

  final dataKategori.DataKategori value;

  @override
  State<SubScreenTabbar> createState() => _SubScreenTabbarState();
}

class _SubScreenTabbarState extends State<SubScreenTabbar> {
  Future<dataBerita.ListBeritaByKategoriResponse>? listBerita;

  @override
  void initState() {
    listBerita= Api.getListBeritaByKategori(widget.value.kodeKategori!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: listBerita,
      builder: (context,
          AsyncSnapshot<dataBerita.ListBeritaByKategoriResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.dataKategori!.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/emoticon.png",height: 100,width: 100,),
                  SizedBox(height: 10,),
                  Text("Ga ada berita Maszeh...",style: Constants.title,)
                ],
              ),
            );
          }
         return showKategoriScreen(snapshot.data!.dataKategori!);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget showKategoriScreen(List<dataBerita.DataKategori> data) {
    return Column(
      children: [
        Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      idBerita: data[index].idBerita!,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        Api.IMG_URL + data[index].gambar!,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                        errorBuilder: (context,obj,stackTrace){
                          return Image.asset("assets/images/place_holder.jpeg");
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment(0, 1),
                            colors: <Color>[
                              Color(0x494949),
                              Color(0xFF505050),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 7,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(data[index].tanggal!,
                                style: Constants.paragraph1,
                                textAlign: TextAlign.start),
                            Text(
                              data[index].judul!,
                              style: Constants.heading1,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
  ),
      ],
    );
  }
}