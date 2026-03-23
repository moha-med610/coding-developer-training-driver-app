import 'package:coding_developer_driver_app/core/constants/user_status.dart';
import 'package:coding_developer_driver_app/core/controllers/ui_cubit.dart';
import 'package:coding_developer_driver_app/core/extensions/locale_extension.dart';
import 'package:coding_developer_driver_app/core/extensions/navigate_extension.dart';
import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_button_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/controllers/auth_cubit.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/custom_login_or_register.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/header_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/register_form.dart';
import 'package:coding_developer_driver_app/features/home/ui/screens/home_screen.dart';
import 'package:coding_developer_driver_app/features/user_status/ui/screens/pending_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String user = UserStatus.pending;

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
                  HeaderWidget(path: "assets/lottie/login.json"),
                  SizedBox(height: 50),
                  Form(key: _formKey, child: RegisterForm()),
                  SizedBox(height: 30),
                  CustomButtonWidget(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: send data to Api
                        // TODO: This Logic is not Final it's for test only and i was replace it
                        // check user status
                        if (user == UserStatus.pending) {
                          context.navigateAndRemoveUntil(
                            PendingScreen(userStatus: user),
                          );
                        } else if (user == UserStatus.approved) {
                          context.navigateAndRemoveUntil(HomeScreen());
                        }
                      } else {
                        print("Register Failed");
                      }
                    },
                    label: context.tr.register,
                    buttonColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: 50),
                  CustomLoginOrRegister(
                    askForAccount: context.tr.alreadyHaveAccount,
                    answer: context.tr.login,
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
