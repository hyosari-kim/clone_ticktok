import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/widget/video/video_action_button.dart';
import 'package:tiktok_clone/widget/video/video_host_avatar.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({super.key, required this.onEndPlay, required this.index});

  final Function onEndPlay;
  final int index;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final videoUrl = "assets/videos/sample_video.mp4";

  late final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset(videoUrl);
  final Duration _duration = const Duration(milliseconds: 300);

  late AnimationController _animationController;

  bool _isPlaying = true;

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    setState(() {});
  }

  void _initAnimationController() {
    _animationController = AnimationController(
        vsync: this,
        duration: _duration,
        lowerBound: 1.0,
        upperBound: 1.5,
        value: 1.5);
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        _animationController.reverse();
      } else {
        _videoPlayerController.play();
        _animationController.forward();
      }

      setState(() {
        _isPlaying = !_isPlaying;
      });
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _initVideoPlayer();
    _initAnimationController();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animationController.value,
                  child: child,
                );
              },
              child: AnimatedOpacity(
                duration: _duration,
                opacity: _isPlaying ? 0 : 1,
                child: const IgnorePointer(
                  child: FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: Sizes.size36,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "@효사리",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w900),
                ),
                Gaps.v12,
                Text(
                  "효사리네 건담 구경하세요.",
                  style: TextStyle(color: Colors.white, fontSize: Sizes.size16),
                ),
                Gaps.v10,
                Text(
                  "#효사리네 #건담",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: Column(
              children: const [
                VideoHostAvatar(),
                Gaps.v28,
                VideoActionButton(
                    icon: FontAwesomeIcons.solidHeart, text: "2.3M"),
                Gaps.v24,
                VideoActionButton(
                    icon: FontAwesomeIcons.solidMessage, text: "33.0K"),
                Gaps.v24,
                VideoActionButton(icon: FontAwesomeIcons.share, text: "Share"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
