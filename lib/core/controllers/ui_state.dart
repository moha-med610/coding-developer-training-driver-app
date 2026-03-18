part of 'ui_cubit.dart';

class UiState {
  final bool isObscure;
  final bool isObscureConfirmPassword;

  const UiState({this.isObscure = true, this.isObscureConfirmPassword = true});

  UiState copyWith({bool? isObscure, bool? isObscureConfirmPassword}) {
    return UiState(
      isObscure: isObscure ?? this.isObscure,
      isObscureConfirmPassword:
          isObscureConfirmPassword ?? this.isObscureConfirmPassword,
    );
  }
}
