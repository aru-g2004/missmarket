import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/images/video.mp4',
    );

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      allowFullScreen: true,
      allowMuting: true,
      showControls: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(9, 17, 62, 1.0),),
          onPressed: () => Navigator.of(context).pop(),
        ),        actions: [
        IconButton(
          icon: Icon(Icons.arrow_forward, color: Color.fromRGBO(9, 17, 62, 1.0),),
          onPressed: () {
            Navigator.pushNamed(context, '/lessons');
          },
        ),
      ],
        backgroundColor:  Color.fromRGBO(245,181,255, 1),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
