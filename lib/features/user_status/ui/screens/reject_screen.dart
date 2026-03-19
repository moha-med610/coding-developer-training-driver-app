import 'package:coding_developer_driver_app/features/user_status/ui/widgets/status_widget.dart';
import 'package:flutter/material.dart';

class RejectScreen extends StatelessWidget {
  const RejectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsetsGeometry.all(24.0),
        child: StatusWidget(
          path: "assets/lottie/reject.json",
          title: "Reject",
          description:
              "Unfortunately, your registration request was not approved.",
          buttonLabel: "Register Again",
          onTap: () {},
          titleStyle: Theme.of(context).primaryTextTheme.headlineLarge!,
          descriptionStyle: Theme.of(context).primaryTextTheme.labelSmall!,
        ),
      ),
    );
  }
}
