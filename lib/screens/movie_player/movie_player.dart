import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gxmovie/main.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  const MoviePlayer({Key key}) : super(key: key);

  @override
  _MoviePlayerState createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  VideoPlayerController _playerController;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _playerController = VideoPlayerController.asset(
      "assets/videos/1.mp4",
    );
    _playerController.addListener(() {
      setState(() {});
    });

    _playerController.initialize().then((value) => setState(() {}));
    _playerController.play();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000313),
      body: Center(
        child: Container(
          child: AspectRatio(
            aspectRatio: _playerController.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(_playerController),
                _ControlsOverlay(controller: _playerController)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key key, @required this.controller})
      : super(key: key);
  final VideoPlayerController controller;

  static const _playbackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () => controller.value.isPlaying
              ? controller.pause()
              : controller.play(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                (route) => false),
            child: controller.value.isPlaying
                ? Container()
                : FaIcon(
                    FontAwesomeIcons.times,
                    color: Colors.white,
                  ),
          ),
        ),
      ],
    );
  }
}
