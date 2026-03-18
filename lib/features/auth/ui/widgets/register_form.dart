import 'package:coding_developer_driver_app/core/constants/document_type.dart';
import 'package:coding_developer_driver_app/core/controllers/ui_cubit.dart';
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
                return "Full Name is required";
              }
              return null;
            },
            prefix: Icon(Icons.person),
            controller: fullNameController,
            keyboardType: TextInputType.name,
            hint: "Full Name",
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone is required";
              }
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
              bool isObscurePassword = state.isObscure;
              bool isObscureConfirmPassword = state.isObscureConfirmPassword;
              return Column(
                children: [
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value != confirmPasswordController.text) {
                        return "Password not match";
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
                    hint: "Password",
                  ),
                  SizedBox(height: 15),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm Password is required";
                      } else if (value != passwordController.text) {
                        return "Password not match";
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
                    hint: "Confirm Password",
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "vehicle brand is required";
              }
              return null;
            },
            controller: vehicleBrandController,
            keyboardType: TextInputType.text,
            hint: "vehicle brand",
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "vehicle number is required";
              }
              return null;
            },
            controller: vehicleNumberController,
            keyboardType: TextInputType.text,
            hint: "Vehicle Number",
          ),
          SizedBox(height: 15),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              return Column(
                children: [
                  DocumentWidget(
                    title: "ID Front",
                    onTap: () {
                      cubit.pickDocument(context, DocumentType.idFront);
                    },
                  ),
                  SizedBox(height: 5),
                  ImagePreview(file: state.idFront),
                  SizedBox(height: 15),
                  DocumentWidget(
                    title: "ID Back",
                    onTap: () {
                      cubit.pickDocument(context, DocumentType.idBack);
                    },
                  ),
                  SizedBox(height: 5),
                  ImagePreview(file: state.idBack),
                  SizedBox(height: 15),
                  DocumentWidget(
                    title: "Driver Licence",
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
