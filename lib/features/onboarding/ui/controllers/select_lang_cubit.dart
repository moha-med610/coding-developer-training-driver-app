import 'package:bloc/bloc.dart';
import 'package:coding_developer_driver_app/core/constants/shared_pref_keys.dart';
import 'package:coding_developer_driver_app/core/enums/language_enum.dart';
import 'package:coding_developer_driver_app/core/services/shared_pref_service.dart';
import 'package:meta/meta.dart';

part 'select_lang_state.dart';

class SelectLangCubit extends Cubit<SelectLangState> {
  SelectLangCubit() : super(SelectLangInitial());

  String selectedLanguage =
      SharedPrefService.getString(SharedPrefKeys.language) ??
      AppLanguage.ar.name;

  void changeLanguage(String value) {
    selectedLanguage = value;

    emit(SelectLangChanged(value));
  }
}
