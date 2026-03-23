import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:coding_developer_driver_app/core/constants/shared_pref_keys.dart';
import 'package:coding_developer_driver_app/core/enums/language_enum.dart';
import 'package:coding_developer_driver_app/core/services/shared_pref_service.dart';

class SelectLangCubit extends Cubit<Locale> {
  SelectLangCubit() : super(Locale("ar"));

  String selectedLanguage =
      SharedPrefService.getString(SharedPrefKeys.language) ??
      AppLanguage.ar.name;

  void changeLanguage(Locale lang) {
    selectedLanguage = lang.languageCode;

    SharedPrefService.saveString(SharedPrefKeys.language, selectedLanguage);

    emit(lang);
  }
}
