import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_button_widget.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_text_form_field.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/custom_login_or_register.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/header_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                HeaderWidget(),
                SizedBox(height: 50),
                LoginForm(),
                SizedBox(height: 5),
                CustomButtonWidget(
                  onTap: () {
                    print("login");
                  },
                  label: "Login",
                  buttonColor: AppColors.primaryColor,
                ),
                SizedBox(height: 50),
                CustomLoginOrRegister(
                  askForAccount: "Don't Have An Account?",
                  answer: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
