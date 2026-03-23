import 'package:coding_developer_driver_app/core/constants/document_type.dart';
import 'package:coding_developer_driver_app/core/controllers/ui_cubit.dart';
import 'package:coding_developer_driver_app/core/extensions/locale_extension.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_text_form_field.dart';
import 'package:coding_developer_driver_app/features/auth/ui/controllers/auth_cubit.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/document_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/widgets/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController vehicleBrandController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    vehicleBrandController.dispose();
    vehicleNumberController.dispose();
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
                return context.tr.fullNameRequired;
              }
              return null;
            },
            prefix: Icon(Icons.person),
            controller: fullNameController,
            keyboardType: TextInputType.name,
            hint: context.tr.fulName,
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.phoneRequired;
              }
              return null;
            },
            prefix: Icon(Icons.phone),
            controller: phoneController,
            keyboardType: TextInputType.phone,
            hint: context.tr.phone,
          ),
          SizedBox(height: 15),
          BlocBuilder<UiCubit, UiState>(
            builder: (context, state) {
              bool isObscurePassword = state.isObscure;
              bool isObscureConfirmPassword = state.isObscureConfirmPassword;
              return Column(
                children: [
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr.passwordRequired;
                      } else if (value != confirmPasswordController.text) {
                        return context.tr.passwordNotMatch;
                      }
                      return null;
                    },
                    prefix: Icon(Icons.lock_outline),
                    suffix: IconButton(
                      onPressed: () {
                        context.read<UiCubit>().togglePassword();
                      },
                      icon: isObscurePassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    obScureText: isObscurePassword,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hint: context.tr.password,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr.confirmPasswordRequired;
                      } else if (value != passwordController.text) {
                        return context.tr.passwordNotMatch;
                      }
                      return null;
                    },
                    prefix: Icon(Icons.lock_outline),
                    suffix: IconButton(
                      onPressed: () {
                        context.read<UiCubit>().toggleConfirmPassword();
                      },
                      icon: isObscureConfirmPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    obScureText: isObscureConfirmPassword,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    hint: context.tr.confirmPassword,
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.vehicleBrandRequired;
              }
              return null;
            },
            controller: vehicleBrandController,
            keyboardType: TextInputType.text,
            hint: context.tr.vehicleBrand,
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr.vehicleNumberRequired;
              }
              return null;
            },
            controller: vehicleNumberController,
            keyboardType: TextInputType.text,
            hint: context.tr.vehicleNumber,
          ),
          SizedBox(height: 15),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              return Column(
                children: [
                  DocumentWidget(
                    title: context.tr.idFront,
                    onTap: () {
                      cubit.pickDocument(context, DocumentType.idFront);
                    },
                  ),
                  SizedBox(height: 5),
                  ImagePreview(file: state.idFront),
                  SizedBox(height: 15),
                  DocumentWidget(
                    title: context.tr.idBack,
                    onTap: () {
                      cubit.pickDocument(context, DocumentType.idBack);
                    },
                  ),
                  SizedBox(height: 5),
                  ImagePreview(file: state.idBack),
                  SizedBox(height: 15),
                  DocumentWidget(
                    title: context.tr.driverLicence,
                    onTap: () {
                      cubit.pickDocument(context, DocumentType.driverLicence);
                    },
                  ),
                  SizedBox(height: 5),
                  ImagePreview(file: state.driverLicence),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
