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
  }) : super(key: key);

  final FaIcon icon;
  final FaIcon selectedIcon;
  final Text label;
  final bool isSelected;
  final Function onNavTap;

  @override
  Widget build(BuildContext context) {
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
                isSelected ? selectedIcon : icon,
                Gaps.v8,
                label,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
