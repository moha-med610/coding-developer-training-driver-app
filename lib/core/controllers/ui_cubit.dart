import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ui_state.dart';

class UiCubit extends Cubit<UiState> {
  UiCubit() : super(const UiState());

  void togglePassword() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void toggleConfirmPassword() {
    emit(
      state.copyWith(isObscureConfirmPassword: !state.isObscureConfirmPassword),
    );
  }
}
