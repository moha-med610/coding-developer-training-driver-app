import 'package:coding_developer_driver_app/core/controllers/ui_cubit.dart';
import 'package:coding_developer_driver_app/core/extensions/navigate_extension.dart';
import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_button_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/controllers/auth_cubit.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/custom_login_or_register.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/header_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/register_form.dart';
import 'package:coding_developer_driver_app/features/user_status/ui/screens/pending_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
                  HeaderWidget(title: "Register"),
                  SizedBox(height: 50),
                  Form(key: _formKey, child: RegisterForm()),
                  SizedBox(height: 30),
                  CustomButtonWidget(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print("Register Success");
                        context.navigateAndRemoveUntil(PendingScreen());
                      } else {
                        print("Register Failed");
                      }
                    },
                    label: "Register",
                    buttonColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: 50),
                  CustomLoginOrRegister(
                    askForAccount: "Already Have An Account?",
                    answer: "Login",
                    onTap: () {
                      context.pop(context);
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
