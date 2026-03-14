import 'package:coding_developer_driver_app/core/routes/app_routes.dart';
import 'package:coding_developer_driver_app/features/auth/ui/screens/login_screen.dart';
import 'package:coding_developer_driver_app/features/auth/ui/screens/register_screen.dart';
import 'package:coding_developer_driver_app/features/home/ui/screens/home_screen.dart';
import 'package:coding_developer_driver_app/features/not_found/ui/screens/not_found_screen.dart';
import 'package:coding_developer_driver_app/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:coding_developer_driver_app/features/splash/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
    }
  }
}
