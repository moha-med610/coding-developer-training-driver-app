import 'package:coding_developer_driver_app/core/services/secure_storage_service.dart';
import 'package:coding_developer_driver_app/core/services/shared_pref_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Shared Preferences init
  await SharedPrefService().init();
  await SecureStorageService().deleteAll();
  runApp(const DriverApp());
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Application',
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
