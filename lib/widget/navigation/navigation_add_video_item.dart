import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';

class NavigationAddVideoButton extends StatefulWidget {
  const NavigationAddVideoButton({
    Key? key,
    required this.onTapButton,
  }) : super(key: key);

  final Function onTapButton;

  @override
  State<NavigationAddVideoButton> createState() =>
      _NavigationAddVideoButtonState();
}

class _NavigationAddVideoButtonState extends State<NavigationAddVideoButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        upperBound: 1.5,
        lowerBound: 1,
        value: 1,
        duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTapAdd() async {
    await _animationController.forward();
    await _animationController.reverse();
    widget.onTapButton();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _onTapAdd,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animationController.value,
              child: child,
            );
          },
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
      ),
    );
  }
}
