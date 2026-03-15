import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/features/onboarding/ui/controllers/select_lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key, required this.lang, required this.value});

  final String lang;
  final String value;

  @override
  Widget build(BuildContext context) {
    final String selectedLanguage = context
        .read<SelectLangCubit>()
        .selectedLanguage;
    final isSelected = selectedLanguage == value;
    return GestureDetector(
      onTap: () {
        context.read<SelectLangCubit>().changeLanguage(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
          ),
        ),
        child: Text(
          lang,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
