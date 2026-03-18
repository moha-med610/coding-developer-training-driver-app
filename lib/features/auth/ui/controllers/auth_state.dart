part of 'auth_cubit.dart';

class AuthState {
  final XFile? idFront;
  final XFile? idBack;
  final XFile? driverLicence;
  final bool loading;

  const AuthState({
    this.idFront,
    this.idBack,
    this.driverLicence,
    this.loading = false,
  });

  AuthState copyWith({
    bool? isObscure,
    bool? isObscureConfirmPassword,
    XFile? idFront,
    XFile? idBack,
    XFile? driverLicence,
    bool? loading,
  }) {
    return AuthState(
      idFront: idFront ?? this.idFront,
      idBack: idBack ?? this.idBack,
      driverLicence: driverLicence ?? this.driverLicence,
      loading: loading ?? this.loading,
    );
  }
}
