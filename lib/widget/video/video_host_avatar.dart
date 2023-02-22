import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoHostAvatar extends StatelessWidget {
  const VideoHostAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(26),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          foregroundImage: NetworkImage(
              "https://s.gravatar.com/avatar/e6a25b9670041b615b4841336872e61b?s=80"),
          child: Text("효사리"),
        ),
        Positioned(
          bottom: -10,
          child: Container(
            padding: const EdgeInsets.all(Sizes.size5),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: Sizes.size10,
            ),
          ),
        )
      ],
    );
  }
}
