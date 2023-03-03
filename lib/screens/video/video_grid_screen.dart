import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoGridScreen extends StatelessWidget {
  const VideoGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size10),
      child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 20,
            crossAxisSpacing: Sizes.size10,
            mainAxisSpacing: Sizes.size10,
          ),
          itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4)),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.jpeg",
                          image:
                              "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"),
                    ),
                  ),
                  Gaps.v5,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.size4),
                    child: Text(
                      "Cajun chicken Alfredo #cooking #foodtiktok, Cajun chicken Alfredo #cooking #foodtiktok",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: Sizes.size16),
                    ),
                  ),
                  Gaps.v5,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.size4),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: Sizes.size14,
                          child: Text("효은"),
                        ),
                        Gaps.h4,
                        Expanded(
                          child: Text(
                            "very long name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey.shade600,
                          size: Sizes.size14,
                        ),
                        Gaps.h2,
                        Text(
                          "2.3M",
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
    );
  }
}
