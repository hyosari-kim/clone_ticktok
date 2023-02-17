import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/main_screen.dart';
import 'package:tiktok_clone/screens/onboarding/tutorial_first_screen.dart';
import 'package:tiktok_clone/screens/onboarding/tutorial_second_screen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  bool _isFinalScreen = false;

  void _onTapAnimation(double value) {
    var lastScreenIndex = 1;
    var index = value.round();

    if (index == lastScreenIndex && !_isFinalScreen) {
      _isFinalScreen = true;
    } else if (index != lastScreenIndex && _isFinalScreen) {
      _isFinalScreen = false;
    }

    setState(() {});
  }

  void _onTapNext() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((context) => const MainScreen())),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        var controller = DefaultTabController.of(context);
        controller?.animation!.addListener(
          () => _onTapAnimation(controller.animation!.value),
        );
        return Scaffold(
          body: const SafeArea(
            child: TabBarView(
              children: [
                TutorialFirstScreen(),
                TutorialSecondScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: Sizes.size28,
                  left: Sizes.size28,
                  right: Sizes.size28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabPageSelector(
                        selectedColor: Theme.of(context).primaryColor,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Gaps.v40,
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    opacity: _isFinalScreen ? 1 : 0,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: CupertinoButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: _onTapNext,
                        child: const Text("Go to app"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
