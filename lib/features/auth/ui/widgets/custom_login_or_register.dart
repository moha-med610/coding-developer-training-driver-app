import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomLoginOrRegister extends StatelessWidget {
  const CustomLoginOrRegister({
    super.key,
    required this.askForAccount,
    required this.answer,
    required this.onTap,
  });

  final String askForAccount;
  final String answer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: askForAccount,
              style: Theme.of(context).primaryTextTheme.bodyMedium,
            ),
            TextSpan(
              text: " $answer",
              style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
