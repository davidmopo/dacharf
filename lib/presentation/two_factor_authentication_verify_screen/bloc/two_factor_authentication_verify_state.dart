// ignore_for_file: must_be_immutable

part of 'two_factor_authentication_verify_bloc.dart';

/// Represents the state of TwoFactorAuthenticationVerify in the application.
class TwoFactorAuthenticationVerifyState extends Equatable {
  TwoFactorAuthenticationVerifyState({
    this.otpController,
    this.twoFactorAuthenticationVerifyModelObj,
  });

  TextEditingController? otpController;

  TwoFactorAuthenticationVerifyModel? twoFactorAuthenticationVerifyModelObj;

  @override
  List<Object?> get props => [
        otpController,
        twoFactorAuthenticationVerifyModelObj,
      ];
  TwoFactorAuthenticationVerifyState copyWith({
    TextEditingController? otpController,
    TwoFactorAuthenticationVerifyModel? twoFactorAuthenticationVerifyModelObj,
  }) {
    return TwoFactorAuthenticationVerifyState(
      otpController: otpController ?? this.otpController,
      twoFactorAuthenticationVerifyModelObj:
          twoFactorAuthenticationVerifyModelObj ??
              this.twoFactorAuthenticationVerifyModelObj,
    );
  }
}
