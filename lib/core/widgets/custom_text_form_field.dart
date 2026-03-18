import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    this.obScureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.hint,
    required this.validator,
    this.suffix,
    this.prefix,
  });

  final int maxLines;
  final bool obScureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hint;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obScureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        prefixIcon: prefix != null ? prefix : null,
        suffixIcon: suffix != null ? suffix : null,
      ),
    );
  }
}
