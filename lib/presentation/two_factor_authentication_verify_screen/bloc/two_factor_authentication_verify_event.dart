// ignore_for_file: must_be_immutable

part of 'two_factor_authentication_verify_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TwoFactorAuthenticationVerify widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TwoFactorAuthenticationVerifyEvent extends Equatable {}

/// Event that is dispatched when the TwoFactorAuthenticationVerify widget is first created.
class TwoFactorAuthenticationVerifyInitialEvent
    extends TwoFactorAuthenticationVerifyEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends TwoFactorAuthenticationVerifyEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
