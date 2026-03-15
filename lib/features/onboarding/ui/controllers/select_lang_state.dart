part of 'select_lang_cubit.dart';

@immutable
sealed class SelectLangState {}

final class SelectLangInitial extends SelectLangState {}

final class SelectLangChanged extends SelectLangState {
  final String value;

  SelectLangChanged(this.value);
}
