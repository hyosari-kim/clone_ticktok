import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/onboarding/select_interest_screen.dart';
import 'package:tiktok_clone/widget/authentication/primary_button.dart';

class CreateBirthDayScreen extends StatefulWidget {
  const CreateBirthDayScreen({super.key});

  @override
  State<CreateBirthDayScreen> createState() => _CreateBirthDayScreenState();
}

class _CreateBirthDayScreenState extends State<CreateBirthDayScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _birthdayController = TextEditingController();
  late AnimationController _animationController;

  final DateTime _initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    _animationController = BottomSheet.createAnimationController(this);
    _animationController.duration = const Duration(seconds: 2);

    _setDate(_initialDate);
  }

  void _setDate(DateTime date) {
    _birthdayController.text = DateFormat.yMMMd().format(date);
  }

  void onTapNext() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SelectInterestScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        actions: [
          Row(
            children: const [
              FaIcon(FontAwesomeIcons.circleQuestion),
              Gaps.h10,
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "When's your birthday?",
                          style: TextStyle(
                            fontSize: Sizes.size16 + Sizes.size2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.v14,
                        Text(
                          "Your birthday won't be shown publicly",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      child: FaIcon(FontAwesomeIcons.cakeCandles,
                          size: Sizes.size60),
                    ),
                  )
                ],
              ),
              Gaps.v32,
              TextField(
                enabled: false,
                controller: _birthdayController,
                decoration: InputDecoration(
                    hintText: "Username",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ))),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v28,
              PrimaryButton(disabled: false, onTap: onTapNext, text: "Sign up"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _initialDate,
              maximumDate: _initialDate.add(const Duration(hours: 1)),
              onDateTimeChanged: (value) => _setDate(value),
            ),
          )),
    );
  }
}
