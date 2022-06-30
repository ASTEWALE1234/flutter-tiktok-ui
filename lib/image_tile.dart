import 'package:flutter/material.dart';
import 'package:test_demo/model/video.dart';
import 'package:video_player/video_player.dart';

class ImageTile extends StatefulWidget {
  const ImageTile({
    Key? key,
    required this.image,
  }) : super(key: key);
  final Video image;

  @override
  State<ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  late VideoPlayerController _videoController;
  late Future _initializeVideoPlayer;
  @override
  void initState() {
    _videoController = VideoPlayerController.asset(
        'assets/${widget.image.postedBy.profileImageUrl}');
    _initializeVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: FutureBuilder(
          future: _initializeVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return VideoPlayer(_videoController);
            } else {
              return Container(
                color: Colors.pink,
              );
            }
          }),
    );
  }
}
