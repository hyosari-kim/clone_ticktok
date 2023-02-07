import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/create_email_screen.dart';
import 'package:tiktok_clone/widget/authentication/primary_button.dart';

class CreateUserNameScreen extends StatefulWidget {
  const CreateUserNameScreen({super.key});

  @override
  State<CreateUserNameScreen> createState() => _CreateUserNameScreenState();
}

class _CreateUserNameScreenState extends State<CreateUserNameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  void onTapScaffold() {
    FocusScope.of(context).unfocus();
  }

  void onTapNext() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateEmailScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapScaffold,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
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
                  "Create username",
                  style: TextStyle(
                    fontSize: Sizes.size16 + Sizes.size2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v14,
                const Text(
                  "You can always change this later.",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                Gaps.v32,
                TextField(
                  controller: _usernameController,
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
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v28,
                PrimaryButton(
                    disabled: _username.isEmpty, onTap: onTapNext, text: "Next")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
