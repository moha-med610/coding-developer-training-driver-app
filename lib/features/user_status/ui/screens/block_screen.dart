import 'package:coding_developer_driver_app/core/extensions/navigate_extension.dart';
import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/features/auth/ui/screens/login_screen.dart';
import 'package:coding_developer_driver_app/features/user_status/ui/widgets/status_widget.dart';
import 'package:flutter/material.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: StatusWidget(
          titleStyle: Theme.of(context).primaryTextTheme.headlineLarge!
              .copyWith(color: Colors.red, fontSize: 30),
          descriptionStyle: Theme.of(
            context,
          ).primaryTextTheme.labelSmall!.copyWith(fontSize: 14),
          path: "assets/lottie/block.json",
          title: "Blocked",
          description:
              "Your account has been temporarily blocked due to a violation of our platform policiesIf you believe this action was taken by mistake.",
          buttonLabel: 'Create New Account',
          onTap: () {
            context.navigateAndRemoveUntil(LoginScreen());
          },
        ),
      ),
    );
  }
}
