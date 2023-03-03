import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/screens/video/video_explore_screen.dart';
import 'package:tiktok_clone/screens/video/video_feed_screen.dart';

import '../widget/navigation/navigation_add_video_item.dart';
import '../widget/navigation/navigation_tab_item.dart';

enum TabType { home, explore, camera, inbox, profile }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TabType _selectedTab = TabType.explore;

  void _onBottomTap(int index) {
    setState(() {
      _selectedTab = _toTabType(index);
    });
  }

  void _onTapAddButton() {}

  TabType _toTabType(int index) {
    if (index == 0) {
      return TabType.home;
    } else if (index == 1) {
      return TabType.explore;
    } else if (index == 2) {
      return TabType.camera;
    } else if (index == 3) {
      return TabType.inbox;
    } else if (index == 4) {
      return TabType.profile;
    }
    throw ErrorSummary("$index is not supported");
  }

  bool _isInvertedNav() {
    if (_selectedTab == TabType.home) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _selectedTab == TabType.home ? Colors.black : Colors.white,
      body: Stack(children: [
        Offstage(
          offstage: _selectedTab != TabType.home,
          child: const VideoFeedScreen(),
        ),
        Offstage(
          offstage: _selectedTab != TabType.explore,
          child: const VideoExploreScreen(),
        ),
        Offstage(
          offstage: _selectedTab != TabType.inbox,
          child: const Center(child: Text("inbox")),
        ),
        Offstage(
          offstage: _selectedTab != TabType.profile,
          child: const Center(child: Text("profile")),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: _isInvertedNav() ? Colors.white : Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTabItem(
              icon: const FaIcon(
                FontAwesomeIcons.house,
                color: Colors.white,
              ),
              selectedIcon: const FaIcon(
                FontAwesomeIcons.house,
                color: Colors.white,
              ),
              invertedIcon: const FaIcon(
                FontAwesomeIcons.house,
                color: Colors.black,
              ),
              invertedSelectedIcon: const FaIcon(
                FontAwesomeIcons.house,
                color: Colors.black,
              ),
              invertedLabel: const Text(
                "home",
                style: TextStyle(color: Colors.black),
              ),
              label: const Text("home", style: TextStyle(color: Colors.white)),
              isSelected: _selectedTab == TabType.home,
              onNavTap: () => _onBottomTap(0),
              isInverted: _isInvertedNav(),
            ),
            NavTabItem(
              icon: const FaIcon(
                FontAwesomeIcons.compass,
                color: Colors.white,
              ),
              selectedIcon: const FaIcon(
                FontAwesomeIcons.solidCompass,
                color: Colors.white,
              ),
              invertedIcon: const FaIcon(
                FontAwesomeIcons.compass,
                color: Colors.black,
              ),
              invertedSelectedIcon: const FaIcon(
                FontAwesomeIcons.solidCompass,
                color: Colors.black,
              ),
              invertedLabel: const Text(
                "explore",
                style: TextStyle(color: Colors.black),
              ),
              label: const Text(
                "explore",
                style: TextStyle(color: Colors.white),
              ),
              isSelected: _selectedTab == TabType.explore,
              onNavTap: () => _onBottomTap(1),
              isInverted: _isInvertedNav(),
            ),
            NavigationAddVideoButton(
              onTapButton: _onTapAddButton,
              isInverted: _isInvertedNav(),
            ),
            NavTabItem(
              icon: const FaIcon(
                FontAwesomeIcons.comment,
                color: Colors.white,
              ),
              selectedIcon: const FaIcon(
                FontAwesomeIcons.solidComment,
                color: Colors.white,
              ),
              label: const Text(
                "inbox",
                style: TextStyle(color: Colors.white),
              ),
              invertedIcon: const FaIcon(
                FontAwesomeIcons.comment,
                color: Colors.black,
              ),
              invertedSelectedIcon: const FaIcon(
                FontAwesomeIcons.solidComment,
                color: Colors.black,
              ),
              invertedLabel: const Text(
                "inbox",
                style: TextStyle(color: Colors.black),
              ),
              isSelected: _selectedTab == TabType.inbox,
              onNavTap: () => _onBottomTap(3),
              isInverted: _isInvertedNav(),
            ),
            NavTabItem(
              icon: const FaIcon(
                FontAwesomeIcons.user,
                color: Colors.white,
              ),
              selectedIcon: const FaIcon(
                FontAwesomeIcons.solidUser,
                color: Colors.white,
              ),
              invertedIcon: const FaIcon(
                FontAwesomeIcons.user,
                color: Colors.black,
              ),
              invertedSelectedIcon: const FaIcon(
                FontAwesomeIcons.solidUser,
                color: Colors.black,
              ),
              invertedLabel: const Text(
                "profile",
                style: TextStyle(color: Colors.black),
              ),
              label:
                  const Text("profile", style: TextStyle(color: Colors.white)),
              isSelected: _selectedTab == TabType.profile,
              onNavTap: () => _onBottomTap(4),
              isInverted: _isInvertedNav(),
            ),
          ],
        ),
      ),
    );
  }
}
