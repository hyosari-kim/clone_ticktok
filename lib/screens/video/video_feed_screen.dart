import 'package:flutter/material.dart';

class VideoFeedScreen extends StatefulWidget {
  const VideoFeedScreen({super.key});

  @override
  State<VideoFeedScreen> createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  final PageController _pageController = PageController();

  final _animationDuration = const Duration(milliseconds: 300);
  final _animationCurve = Curves.linear;

  List<Widget> contents = [
    Container(
      decoration: const BoxDecoration(color: Colors.green),
      child: const Center(
        child: Text("0 Screen"),
      ),
    ),
    Container(
      decoration: const BoxDecoration(color: Colors.blue),
      child: const Center(
        child: Text("1 Screen"),
      ),
    ),
    Container(
      decoration: const BoxDecoration(color: Colors.yellow),
      child: const Center(
        child: Text("2 Screen"),
      ),
    )
  ];

  void _onPageChanged(int index) {
    _pageController.animateToPage(index,
        duration: _animationDuration, curve: _animationCurve);

    if (index == contents.length - 1) {
      contents.addAll(
        [
          Container(
            decoration: const BoxDecoration(color: Colors.green),
            child: const Center(
              child: Text("0 Screen"),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Center(
              child: Text("1 Screen"),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.yellow),
            child: const Center(
              child: Text("2 Screen"),
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        return contents[index];
      },
    );
  }
}
