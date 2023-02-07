import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/create_password_screen.dart';
import 'package:tiktok_clone/widget/authentication/primary_button.dart';

class CreateEmailScreen extends StatefulWidget {
  const CreateEmailScreen({super.key});

  @override
  State<CreateEmailScreen> createState() => _CreateEmailScreenState();
}

class _CreateEmailScreenState extends State<CreateEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  bool validate(String email) {
    var pattern = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return email.isEmpty || pattern.hasMatch(email);
  }

  void onTapScaffold() {
    FocusScope.of(context).unfocus();
  }

  void onTapNext() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CreatePasswordScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapScaffold,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          actions: [
            Row(
              children: const [
                FaIcon(FontAwesomeIcons.circleQuestion),
                Gaps.h10,
              ],
            )
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
                const Text(
                  "What is your email?",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v28,
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      errorText: validate(_email) ? null : "Check your email.",
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
                PrimaryButton(
                    disabled: _email.isEmpty || !validate(_email),
                    onTap: onTapNext,
                    text: "Next"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
