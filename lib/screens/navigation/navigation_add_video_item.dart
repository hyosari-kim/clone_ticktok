import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';

class NavigationAddVideoButton extends StatelessWidget {
  const NavigationAddVideoButton({
    Key? key,
    required this.onTapButton,
  }) : super(key: key);

  final Function onTapButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTapButton(),
        child: Container(
          height: 69,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Center(
            heightFactor: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 20,
                  child: Container(
                    width: 20,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: Container(
                    width: 20,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: Sizes.size16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
