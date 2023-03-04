import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class VideoExploreScreen extends StatefulWidget {
  const VideoExploreScreen({super.key});

  @override
  State<VideoExploreScreen> createState() => _VideoExploreScreenState();
}

class _VideoExploreScreenState extends State<VideoExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _isTextValueExists = false;

  void _onTapClear() {
    _searchController.clear();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
  }

  void _onPanDownTabView(DragDownDetails dd) {
    _stopWriting();
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _isTextValueExists = _searchController.value.text != "";
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              filled: true,
              isCollapsed: true,
              contentPadding: const EdgeInsets.only(
                top: Sizes.size14,
                bottom: Sizes.size14,
                right: Sizes.size4,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.size12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.grey.shade800,
                ),
              ),
              prefixIconConstraints:
                  const BoxConstraints(maxWidth: Sizes.size52),
              suffixIcon: _isTextValueExists
                  ? Padding(
                      padding: const EdgeInsets.all(Sizes.size8),
                      child: GestureDetector(
                        onTap: _onTapClear,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade600,
                          size: Sizes.size20,
                        ),
                      ),
                    )
                  : null,
              suffixIconConstraints:
                  const BoxConstraints(maxWidth: Sizes.size36),
            ),
          ),
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
            onTap: (_) => _stopWriting(),
            tabs: [
              for (var tab in tabs)
                Padding(
                    padding: const EdgeInsets.only(bottom: Sizes.size10),
                    child: Text(tab)),
            ],
          ),
        ),
        body: GestureDetector(
          onPanDown: _onPanDownTabView,
          child: TabBarView(
            children: [
              const VideoGridScreen(),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(tab),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
