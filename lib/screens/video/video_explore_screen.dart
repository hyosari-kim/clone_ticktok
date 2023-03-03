import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/video/video_grid_screen.dart';

List<String> tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class VideoExploreScreen extends StatelessWidget {
  const VideoExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("explore"),
          elevation: 0.5,
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            unselectedLabelStyle: TextStyle(
              color: Colors.grey.shade200,
              fontWeight: FontWeight.w500,
            ),
            labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w500),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              for (var tab in tabs)
                Padding(
                    padding: const EdgeInsets.only(bottom: Sizes.size10),
                    child: Text(tab)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const VideoGridScreen(),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}
