import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/widget/onbarding/interest_chip.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class SelectInterestScreen extends StatefulWidget {
  const SelectInterestScreen({super.key});

  @override
  State<SelectInterestScreen> createState() => _SelectInterestScreenState();
}

class _SelectInterestScreenState extends State<SelectInterestScreen> {
  final ScrollController _scrollbarController = ScrollController();
  bool _isAppBarShow = false;

  void _onScroll() {
    var isOverThreshold = _scrollbarController.offset > 110;

    if (isOverThreshold && !_isAppBarShow) {
      _isAppBarShow = true;
    } else if (!isOverThreshold && _isAppBarShow) {
      _isAppBarShow = false;
    }

    setState(() {});
  }

  void onTapNext() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TutorialScreen()));
  }

  @override
  void initState() {
    super.initState();

    _scrollbarController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollbarController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isAppBarShow ? 1 : 0,
          child: const Text("Choose your interests"),
        ),
        elevation: _isAppBarShow ? 0.3 : 0,
      ),
      body: Scrollbar(
        controller: _scrollbarController,
        child: SingleChildScrollView(
          controller: _scrollbarController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
            child: Column(
              children: [
                Gaps.v20,
                const Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Gaps.v20,
                Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.size24),
                  child: Wrap(
                    spacing: Sizes.size10,
                    runSpacing: Sizes.size20,
                    children: [
                      for (var item in interests) InterestChip(item: item)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
              top: Sizes.size10,
              bottom: Sizes.size24,
              left: Sizes.size20,
              right: Sizes.size20),
          child: Row(
            children: [
              Expanded(
                child: CupertinoButton(
                  color: Colors.grey.shade400,
                  onPressed: onTapNext,
                  child: const Text("Skip"),
                ),
              ),
              Gaps.h10,
              Expanded(
                child: CupertinoButton(
                  disabledColor: Colors.grey.shade400,
                  color: Theme.of(context).primaryColor,
                  onPressed: onTapNext,
                  child: const Text("Next"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
