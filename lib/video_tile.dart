import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_demo/model/video.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile(
      {Key? key,
      required this.video,
      required this.snapedPageIndex,
      required this.currentIndex})
      : super(key: key);
  final Video video;
  final int snapedPageIndex;
  final int currentIndex;

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _videoController;
  late Future _initializeVideoPlayer;
  bool _isPlay = true;
  @override
  void initState() {
    _videoController =
        VideoPlayerController.asset('assets/${widget.video.videoUrl}');
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

  void _playPauseVideo() {
    _isPlay ? _videoController.pause() : _videoController.play();
    setState(() {
      _isPlay = !_isPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    (widget.snapedPageIndex == widget.currentIndex && _isPlay)
        ? _videoController.play()
        : _videoController.pause();
    return Container(
      color: Colors.red,
      child: FutureBuilder(
          future: _initializeVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(alignment: Alignment.center, children: [
                VideoPlayer(_videoController),
                IconButton(
                    onPressed: () {
                      _playPauseVideo();
                    },
                    icon: Icon(
                      _isPlay ? Icons.pause : Icons.play_arrow,
                      color: _isPlay ? Colors.white10 : Colors.white,
                      size: _isPlay ? 20 : 40,
                    ))
              ]);
            } else {
              return Container(
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/loader.json",
                      height: 150, width: 150, fit: BoxFit.cover));
            }
          }),
    );
  }
}
