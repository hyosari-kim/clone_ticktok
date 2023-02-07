import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestChip extends StatefulWidget {
  const InterestChip({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  State<InterestChip> createState() => _InterestChipState();
}

class _InterestChipState extends State<InterestChip> {
  bool _isSelected = false;

  void _onTapSelectToggle() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapSelectToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
          vertical: Sizes.size14,
        ),
        decoration: BoxDecoration(
            color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(90),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 5,
              )
            ]),
        child: Text(
          widget.item,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: _isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
