import 'package:coding_developer_driver_app/core/controllers/ui_cubit.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "phone is required";
              }
              ;
              return null;
            },
            prefix: Icon(Icons.phone),
            controller: phoneController,
            keyboardType: TextInputType.phone,
            hint: "Phone",
          ),
          SizedBox(height: 15),
          BlocBuilder<UiCubit, UiState>(
            builder: (context, state) {
              return CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password is required";
                  }
                  ;
                  return null;
                },
                prefix: Icon(Icons.lock_outline),
                suffix: IconButton(
                  onPressed: () {
                    context.read<UiCubit>().togglePassword();
                  },
                  icon: state.isObscure
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                obScureText: state.isObscure,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                hint: "Password",
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Forget Password Screen
                print("text button");
              },
              child: Text(
                "Forget Password?",
                style: Theme.of(context).primaryTextTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
