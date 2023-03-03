import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class NavTabItem extends StatelessWidget {
  const NavTabItem({
    Key? key,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onNavTap,
    required this.invertedIcon,
    required this.invertedSelectedIcon,
    required this.invertedLabel,
    required this.isInverted,
  }) : super(key: key);

  final FaIcon icon;
  final FaIcon selectedIcon;
  final Text label;
  final FaIcon invertedIcon;
  final FaIcon invertedSelectedIcon;
  final Text invertedLabel;
  final bool isSelected;
  final Function onNavTap;
  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    FaIcon navIcon = isInverted ? invertedIcon : icon;
    FaIcon navSelectedIcon = isInverted ? invertedSelectedIcon : selectedIcon;
    Text navLabel = isInverted ? invertedLabel : label;

    return Expanded(
      child: GestureDetector(
        onTap: () => onNavTap(),
        child: Container(
          padding: const EdgeInsets.all(Sizes.size10),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isSelected ? 1 : 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isSelected ? navSelectedIcon : navIcon,
                Gaps.v8,
                navLabel,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
