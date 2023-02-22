import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoDescription extends StatefulWidget {
  const VideoDescription({
    Key? key,
    required this.host,
    required this.description,
    required this.tags,
  }) : super(key: key);

  final String host;
  final String description;
  final String tags;

  @override
  State<VideoDescription> createState() => _VideoDescriptionState();
}

class _VideoDescriptionState extends State<VideoDescription> {
  final int maxLength = 25;

  bool _needTruncated = false;
  bool _expand = false;

  void _expandTags() {
    setState(() {
      _expand = true;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _needTruncated = widget.tags.length > maxLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.host,
          style: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w900),
        ),
        Gaps.v12,
        Text(
          widget.description,
          style: const TextStyle(color: Colors.white, fontSize: Sizes.size16),
        ),
        Gaps.v10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              clipBehavior: Clip.none,
              child: SizedBox(
                width: 170,
                child: Text(
                  _needTruncated && !_expand
                      ? "${widget.tags.substring(0, 18)}..."
                      : widget.tags,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Gaps.h10,
            if (_needTruncated && !_expand)
              GestureDetector(
                onTap: _expandTags,
                child: const Text(
                  "See more",
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        )
      ],
    );
  }
}
