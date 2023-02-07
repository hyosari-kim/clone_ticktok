import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/screens/authentication/login_form_screen.dart';
import 'package:tiktok_clone/widget/authentication/auth_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onTapLogin(context) {
    Navigator.of(context).pop();
  }

  void _onTapUseEmailTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v52,
              const Text(
                "Log in to TikTok",
                style: TextStyle(
                  fontSize: Sizes.size20 + Sizes.size2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "Manage your account, check notifications, comment on videos, and more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onTapUseEmailTap(context),
                child: const AuthButton(
                  text: 'Use phone / email / username',
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                    size: Sizes.size16,
                  ),
                ),
              ),
              Gaps.v12,
              GestureDetector(
                onTap: () => _onTapUseEmailTap(context),
                child: const AuthButton(
                  text: 'Continue with Apple',
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    size: Sizes.size20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              Gaps.h3,
              GestureDetector(
                onTap: () => _onTapLogin(context),
                child: Text("Sign up",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
