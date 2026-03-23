import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/features/user_status/ui/widgets/status_widget.dart';
import 'package:flutter/material.dart';

class RejectScreen extends StatelessWidget {
  const RejectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(24.0),
        child: StatusWidget(
          path: "assets/lottie/reject.json",
          title: "Reject",
          description:
              "Unfortunately, your registration request was not approved.",
          buttonLabel: "Register Again",
          onTap: () {},
          titleStyle: Theme.of(context).primaryTextTheme.headlineLarge!
              .copyWith(color: Colors.red, fontSize: 30),
          descriptionStyle: Theme.of(
            context,
          ).primaryTextTheme.labelSmall!.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
