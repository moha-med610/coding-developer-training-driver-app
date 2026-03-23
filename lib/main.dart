import 'package:coding_developer_driver_app/core/constants/shared_pref_keys.dart';
import 'package:coding_developer_driver_app/core/di/app_di.dart';
import 'package:coding_developer_driver_app/core/enums/language_enum.dart';
import 'package:coding_developer_driver_app/core/routes/app_router.dart';
import 'package:coding_developer_driver_app/core/routes/app_routes.dart';
import 'package:coding_developer_driver_app/core/services/shared_pref_service.dart';
import 'package:coding_developer_driver_app/core/theming/light_theme.dart';
import 'package:coding_developer_driver_app/features/onboarding/ui/controllers/select_lang_cubit.dart';
import 'package:coding_developer_driver_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Shared Preferences init
  await SharedPrefService.init();

  // await SharedPrefService.clear();

  // Dependency Injection init
  await AppDi.init();

  runApp(
    BlocProvider(create: (context) => SelectLangCubit(), child: DriverApp()),
  );
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  // final String? lang;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectLangCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: context.read<SelectLangCubit>().state,
          supportedLocales: const [Locale("ar"), Locale("en")],
          theme: lightTheme,
          title: 'Driver Application',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
