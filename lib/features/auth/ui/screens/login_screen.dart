import 'package:coding_developer_driver_app/core/controllers/ui_cubit.dart';
import 'package:coding_developer_driver_app/core/extensions/navigate_extension.dart';
import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_button_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/controllers/auth_cubit.dart';
import 'package:coding_developer_driver_app/features/auth/ui/screens/register_screen.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/custom_login_or_register.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/header_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UiCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  HeaderWidget(title: "Login"),
                  SizedBox(height: 50),
                  Form(key: _formKey, child: LoginForm()),
                  SizedBox(height: 5),
                  CustomButtonWidget(
                    onTap: () {
                      // TODO: Login Logic
                      if (_formKey.currentState!.validate()) {
                        print("Login Success");
                      } else {
                        print("Login Failed");
                      }
                    },
                    label: "Login",
                    buttonColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: 50),
                  CustomLoginOrRegister(
                    askForAccount: "Don't Have An Account?",
                    answer: "Register",
                    onTap: () {
                      context.navigateTo(RegisterScreen());
                    },
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
