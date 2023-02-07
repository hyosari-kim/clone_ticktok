import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/create_birthday_screen.dart';
import 'package:tiktok_clone/widget/authentication/primary_button.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscure = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void onTapScaffold() {
    FocusScope.of(context).unfocus();
  }

  void onTapNext() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CreateBirthDayScreen()),
    );
  }

  bool validateLetter(String password) {
    var pattern = RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~])');

    return pattern.hasMatch(password);
  }

  bool validateLength(String password) {
    var pattern = RegExp(r'^.{8,20}$');

    return pattern.hasMatch(password);
  }

  bool validate(String password) {
    var validates = [validateLetter, validateLength];

    return password.isEmpty ||
        validates.map((val) => val(password)).every(((element) => element));
  }

  void _onTapClear() {
    _passwordController.clear();
  }

  void _onTapObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();

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
                  "Create password",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v28,
                TextField(
                  controller: _passwordController,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    hintText: "Make it strong",
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
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onTapClear,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade400,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h10,
                        GestureDetector(
                          onTap: _onTapObscure,
                          child: _obscure
                              ? FaIcon(FontAwesomeIcons.eye,
                                  size: Sizes.size20,
                                  color: Colors.grey.shade400)
                              : FaIcon(FontAwesomeIcons.eyeSlash,
                                  size: Sizes.size20,
                                  color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v12,
                const Text(
                  "Your password must have:",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.v10,
                Column(
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size16 + Sizes.size2,
                          color: validateLength(_password)
                              ? Colors.green
                              : Colors.grey,
                        ),
                        Gaps.h5,
                        const Text(
                          "8 to 20 characters",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Gaps.v6,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size16 + Sizes.size2,
                          color: validateLetter(_password)
                              ? Colors.green
                              : Colors.grey,
                        ),
                        Gaps.h5,
                        const Text(
                          "Letters, numbers, and special characters",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
                Gaps.v32,
                PrimaryButton(
                    disabled: _password.isEmpty || !validate(_password),
                    onTap: onTapNext,
                    text: "Next")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
