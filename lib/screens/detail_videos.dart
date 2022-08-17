import 'package:flutter/material.dart';
import 'package:portal_berita/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTPlayer extends StatefulWidget {
  final String idVideo;
  final String title;
  final String subtitle;

  const YTPlayer(
      {Key? key,
      required this.idVideo,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  State<YTPlayer> createState() => _YTPlayerState();
}

class _YTPlayerState extends State<YTPlayer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.idVideo,
      flags: YoutubePlayerFlags(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (_, controller) {
          return Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 5),
              controller: controller,
              children: [
                Column(
                  children: [
                    Center(
                      child: YoutubePlayer(
                        controller: _controller!,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.red,
                        progressColors: ProgressBarColors(
                          playedColor: Colors.red,
                          handleColor: Colors.red,
                        ),
                        onReady: () {},
                      ),
                    ),
                    Text(
                      widget.title,
                      style: Constants.title,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.subtitle),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
