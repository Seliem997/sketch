import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;


  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
        _controller1.play();
        _controller1.setLooping(true);
        Future.delayed(Duration(seconds: 3), () {
          _controller1.pause();
        });
      });

    _controller2 = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
        _controller2.play();
        _controller2.setLooping(true);
        Future.delayed(Duration(seconds: 3), () {
          _controller2.pause();
        });
      });
  }
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullScreenVideo(_controller1)),
                );
              },
              child: Container(
                height: 200,
                width: 300,
                child: _controller1.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller1.value.aspectRatio,
                  child: VideoPlayer(_controller1),
                )
                    : Container(),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullScreenVideo(_controller2)),
                );
              },
              child: Container(
                height: 200,
                width: 300,
                child: _controller2.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller2.value.aspectRatio,
                  child: VideoPlayer(_controller2),
                )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class FullScreenVideo extends StatelessWidget {
  final VideoPlayerController controller;

  FullScreenVideo(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Video'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
