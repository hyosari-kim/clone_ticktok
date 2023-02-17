import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/main_screen.dart';
import 'package:tiktok_clone/widget/authentication/primary_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState == null) return;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(formData);

      _goNextPage();
    }
  }

  void _goNextPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((context) => const MainScreen())),
        (route) => false);
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              Gaps.v28,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "username / email",
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "email is empty";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["email"] = newValue;
                        }
                      },
                    ),
                    Gaps.v10,
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "password",
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
                      validator: (value) => (value != null && value.isEmpty)
                          ? "password is empty"
                          : null,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["password"] = newValue;
                        }
                      },
                    )
                  ],
                ),
              ),
              Gaps.v28,
              PrimaryButton(
                  disabled: false, onTap: _onSubmitTap, text: "Log in")
            ],
          ),
        ),
      ),
    );
  }
}
