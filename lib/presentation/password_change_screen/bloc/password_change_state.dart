// ignore_for_file: must_be_immutable

part of 'password_change_bloc.dart';

/// Represents the state of PasswordChange in the application.
class PasswordChangeState extends Equatable {
  PasswordChangeState({
    this.passwordController,
    this.newpasswordController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.passwordChangeModelObj,
  });

  TextEditingController? passwordController;

  TextEditingController? newpasswordController;

  PasswordChangeModel? passwordChangeModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        passwordController,
        newpasswordController,
        isShowPassword,
        isShowPassword1,
        passwordChangeModelObj,
      ];
  PasswordChangeState copyWith({
    TextEditingController? passwordController,
    TextEditingController? newpasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    PasswordChangeModel? passwordChangeModelObj,
  }) {
    return PasswordChangeState(
      passwordController: passwordController ?? this.passwordController,
      newpasswordController:
          newpasswordController ?? this.newpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      passwordChangeModelObj:
          passwordChangeModelObj ?? this.passwordChangeModelObj,
    );
  }
}
