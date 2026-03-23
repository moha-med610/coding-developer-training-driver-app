import 'package:coding_developer_driver_app/core/enums/language_enum.dart';
import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/features/onboarding/ui/controllers/select_lang_cubit.dart';
import 'package:coding_developer_driver_app/features/onboarding/ui/widgets/language_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLanguageCards extends StatelessWidget {
  const SelectLanguageCards({
    super.key,
    required this.onChange,
    required this.selectedLanguage,
  });

  final String selectedLanguage;
  final ValueChanged<String?> onChange;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>(
      groupValue: selectedLanguage,
      onChanged: onChange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LanguageCard(lang: "العربيه", value: AppLanguage.ar.name),
          SizedBox(height: 20),
          LanguageCard(lang: "English", value: AppLanguage.en.name),
        ],
      ),
    );
  }
}
