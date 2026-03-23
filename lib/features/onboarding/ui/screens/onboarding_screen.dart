import 'package:coding_developer_driver_app/core/constants/shared_pref_keys.dart';
import 'package:coding_developer_driver_app/core/extensions/locale_extension.dart';
import 'package:coding_developer_driver_app/core/extensions/navigate_extension.dart';
import 'package:coding_developer_driver_app/core/services/shared_pref_service.dart';
import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/core/widgets/custom_button_widget.dart';
import 'package:coding_developer_driver_app/features/auth/ui/screens/login_screen.dart';
import 'package:coding_developer_driver_app/features/onboarding/ui/controllers/select_lang_cubit.dart';
import 'package:coding_developer_driver_app/features/onboarding/ui/widgets/select_language_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: BlocBuilder<SelectLangCubit, Locale>(
          builder: (context, state) {
            final selectedLanguage = context
                .read<SelectLangCubit>()
                .selectedLanguage;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        SelectLanguageCards(
                          selectedLanguage: selectedLanguage,
                          onChange: (value) {
                            context.watch()<SelectLangCubit>().changeLanguage(
                              Locale(value!),
                            );
                          },
                        ),
                        Spacer(),
                        CustomButtonWidget(
                          radius: 25,
                          label: context.tr.getStarted,
                          buttonColor: AppColors.primaryColor,
                          onTap: () async {
                            await SharedPrefService.saveString(
                              SharedPrefKeys.language,
                              selectedLanguage,
                            );

                            context.navigateAndReplace(LoginScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
