import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/screens/authentication/create_user_name_screen.dart';
import 'package:tiktok_clone/widget/authentication/auth_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onTapLogin(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const LoginScreen()),
      ),
    );
  }

  void _onTapUseEmail(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CreateUserNameScreen()));
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
                "Sign up for TikTok",
                style: TextStyle(
                  fontSize: Sizes.size20 + Sizes.size2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onTapUseEmail(context),
                child: const AuthButton(
                  text: 'Use phone or username',
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                    size: Sizes.size16,
                  ),
                ),
              ),
              Gaps.v12,
              GestureDetector(
                onTap: () => _onTapUseEmail(context),
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
              const Text("Already have an account?"),
              Gaps.h3,
              GestureDetector(
                onTap: () => _onTapLogin(context),
                child: Text("Log in",
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
