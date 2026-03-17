import 'package:coding_developer_driver_app/core/constants/shared_pref_keys.dart';
import 'package:coding_developer_driver_app/core/di/app_di.dart';
import 'package:coding_developer_driver_app/core/enums/language_enum.dart';
import 'package:coding_developer_driver_app/core/routes/app_router.dart';
import 'package:coding_developer_driver_app/core/routes/app_routes.dart';
import 'package:coding_developer_driver_app/core/services/shared_pref_service.dart';
import 'package:coding_developer_driver_app/core/theming/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Shared Preferences init
  await SharedPrefService.init();
  // await SharedPrefService.clear();

  // Dependency Injection init
  await AppDi.init();

  // get App Language
  final String? appLanguage = SharedPrefService.getString(
    SharedPrefKeys.language,
  );

  runApp(DriverApp(lang: appLanguage));
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key, this.lang});

  final String? lang;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      title: 'Driver Application',
      locale: Locale(lang ?? AppLanguage.ar.name),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
