import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialSecondScreen extends StatelessWidget {
  const TutorialSecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Gaps.v36,
          Text(
            "Let's go",
            style: TextStyle(
              fontSize: Sizes.size44,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v14,
          Text(
            "Enjoy the app",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
