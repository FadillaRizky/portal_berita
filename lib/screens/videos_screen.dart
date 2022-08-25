import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube/youtube_thumbnail.dart';

import '../constants.dart';
import 'detail_videos.dart';

class GaleriYoutube extends StatefulWidget {

  const GaleriYoutube({Key? key, }) : super(key: key);

  @override
  State<GaleriYoutube> createState() => _GaleriYoutubeState();
}

class _GaleriYoutubeState extends State<GaleriYoutube> {
  List videos = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data_youtube.json');
    final data = await json.decode(response);
    setState(() {
      videos = data["videos"];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: List.generate(
                  videos.length,
                  (index) => GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.black12,
                          builder: (context) {
                            return YTPlayer(idVideo: videos[index]['video'], title: videos[index]['title'], subtitle: videos[index]['subtitle'],);
                          });
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [

                            Image.network(
                            YoutubeThumbnail(youtubeId: videos[index]['video'])
                                .hd(),
                            width: 350,
                            height: 200,
                            fit: BoxFit.cover,
                          ),


                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 80,
                              ),
                            ),
                          ]
                        ),
                        Container(
                          color: Colors.white,
                          width: 350,
                          height: 70,
                          child: Text(
                            videos[index]['title'],
                            style: Constants.title,

                          ),
                        )
                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
