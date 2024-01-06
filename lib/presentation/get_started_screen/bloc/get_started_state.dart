// ignore_for_file: must_be_immutable

part of 'get_started_bloc.dart';

/// Represents the state of GetStarted in the application.
class GetStartedState extends Equatable {
  GetStartedState({
    this.phoneNumberController,
    this.passwordController,
    this.passwordController1,
    this.emailController,
    this.getStartedModelObj,
  });

  TextEditingController? phoneNumberController;

  TextEditingController? passwordController;

  TextEditingController? passwordController1;

  TextEditingController? emailController;

  GetStartedModel? getStartedModelObj;

  @override
  List<Object?> get props => [
        phoneNumberController,
        passwordController,
        passwordController1,
        emailController,
        getStartedModelObj,
      ];
  GetStartedState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? passwordController,
    TextEditingController? passwordController1,
    TextEditingController? emailController,
    GetStartedModel? getStartedModelObj,
  }) {
    return GetStartedState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      passwordController: passwordController ?? this.passwordController,
      passwordController1: passwordController1 ?? this.passwordController1,
      emailController: emailController ?? this.emailController,
      getStartedModelObj: getStartedModelObj ?? this.getStartedModelObj,
    );
  }
}
