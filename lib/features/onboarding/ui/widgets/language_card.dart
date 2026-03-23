import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/select_lang_cubit.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key, required this.lang, required this.value});

  final String lang;
  final String value;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<SelectLangCubit>().state;
    final isSelected = locale.languageCode == value;

    return GestureDetector(
      onTap: () {
        context.read<SelectLangCubit>().changeLanguage(Locale(value));
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
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
