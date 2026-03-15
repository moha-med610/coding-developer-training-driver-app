import 'package:coding_developer_driver_app/core/constants/secure_keys.dart';
import 'package:coding_developer_driver_app/core/constants/shared_pref_keys.dart';
import 'package:coding_developer_driver_app/core/extensions/navigate_extension.dart';
import 'package:coding_developer_driver_app/core/routes/app_routes.dart';
import 'package:coding_developer_driver_app/core/services/secure_storage_service.dart';
import 'package:coding_developer_driver_app/core/services/shared_pref_service.dart';
import 'package:coding_developer_driver_app/core/theming/colors.dart';
import 'package:coding_developer_driver_app/features/splash/ui/widgets/loading_splash_widget.dart';
import 'package:coding_developer_driver_app/features/splash/ui/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(Duration(seconds: 2));

    final bool isFirstTime =
        SharedPrefService.getBool(SharedPrefKeys.isFirstTime) ?? true;

    final String? isLoggedIn = await SecureStorageService().read(
      key: SecureKeys.accessToken,
    );
    if (isFirstTime) {
      context.navigateRouteNamedAndReplace(AppRoutes.onboardingScreen);
    } else if (isLoggedIn != null) {
      context.navigateRouteNamedAndReplace(AppRoutes.homeScreen);
    } else {
      context.navigateRouteNamedAndReplace(AppRoutes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              width: double.infinity,
              height: double.infinity / 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  LogoWidget(),
                  Spacer(),
                  LoadingSplashWidget(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
