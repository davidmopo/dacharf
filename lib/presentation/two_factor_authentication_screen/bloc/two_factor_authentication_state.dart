// ignore_for_file: must_be_immutable

part of 'two_factor_authentication_bloc.dart';

/// Represents the state of TwoFactorAuthentication in the application.
class TwoFactorAuthenticationState extends Equatable {
  TwoFactorAuthenticationState({this.twoFactorAuthenticationModelObj});

  TwoFactorAuthenticationModel? twoFactorAuthenticationModelObj;

  @override
  List<Object?> get props => [
        twoFactorAuthenticationModelObj,
      ];
  TwoFactorAuthenticationState copyWith(
      {TwoFactorAuthenticationModel? twoFactorAuthenticationModelObj}) {
    return TwoFactorAuthenticationState(
      twoFactorAuthenticationModelObj: twoFactorAuthenticationModelObj ??
          this.twoFactorAuthenticationModelObj,
    );
  }
}
