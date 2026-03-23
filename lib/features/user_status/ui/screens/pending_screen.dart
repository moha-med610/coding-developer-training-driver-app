import 'package:coding_developer_driver_app/core/constants/user_status.dart';
import 'package:coding_developer_driver_app/core/extensions/navigate_extension.dart';
import 'package:coding_developer_driver_app/features/home/ui/screens/home_screen.dart';
import 'package:coding_developer_driver_app/features/user_status/ui/widgets/status_widget.dart';
import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key, required this.userStatus});

  final String userStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: StatusWidget(
          titleStyle: Theme.of(context).primaryTextTheme.headlineLarge!
              .copyWith(color: Colors.green, fontSize: 30),
          descriptionStyle: Theme.of(
            context,
          ).primaryTextTheme.labelSmall!.copyWith(fontSize: 14),
          // TODO: replace this icon
          path: "assets/lottie/pending.json",
          title: "Pending",
          description:
              "Your account is currently under review. Our team is verifying your information to ensure a safe and trusted experience for all users. You will be notified as soon as your account is approved.",
          buttonLabel: "Refresh",
          onTap: () {
            if (userStatus == UserStatus.approved) {
              return context.navigateAndReplace(HomeScreen());
            } else {
              return;
            }
          },
        ),
      ),
    );
  }
}
