import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navigation/navigation_add_video_item.dart';
import 'navigation/navigation_tab_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  List<Widget> screens = [
    const Center(child: Text("home")),
    const Center(child: Text("search")),
    Container(),
    const Center(child: Text("inbox")),
    const Center(child: Text("profile"))
  ];

  void _onBottomTap(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _onTapAddButton() {
    print("button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _selectedTab != 0,
          child: const Center(child: Text("home")),
        ),
        Offstage(
          offstage: _selectedTab != 1,
          child: const Center(child: Text("explore")),
        ),
        Offstage(
          offstage: _selectedTab != 3,
          child: const Center(child: Text("inbox")),
        ),
        Offstage(
          offstage: _selectedTab != 4,
          child: const Center(child: Text("profile")),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
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
              label: const Text("home", style: TextStyle(color: Colors.white)),
              isSelected: _selectedTab == 0,
              onNavTap: () => _onBottomTap(0),
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
              label:
                  const Text("explore", style: TextStyle(color: Colors.white)),
              isSelected: _selectedTab == 1,
              onNavTap: () => _onBottomTap(1),
            ),
            NavigationAddVideoButton(
              onTapButton: _onTapAddButton,
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
              label: const Text("inbox", style: TextStyle(color: Colors.white)),
              isSelected: _selectedTab == 3,
              onNavTap: () => _onBottomTap(3),
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
              label:
                  const Text("profile", style: TextStyle(color: Colors.white)),
              isSelected: _selectedTab == 4,
              onNavTap: () => _onBottomTap(4),
            ),
          ],
        ),
      ),
    );
  }
}