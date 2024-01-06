import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/two_factor_authentication_verify_screen/models/two_factor_authentication_verify_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'two_factor_authentication_verify_event.dart';
part 'two_factor_authentication_verify_state.dart';

/// A bloc that manages the state of a TwoFactorAuthenticationVerify according to the event that is dispatched to it.
class TwoFactorAuthenticationVerifyBloc extends Bloc<
    TwoFactorAuthenticationVerifyEvent,
    TwoFactorAuthenticationVerifyState> with CodeAutoFill {
  TwoFactorAuthenticationVerifyBloc(
      TwoFactorAuthenticationVerifyState initialState)
      : super(initialState) {
    on<TwoFactorAuthenticationVerifyInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<TwoFactorAuthenticationVerifyState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    TwoFactorAuthenticationVerifyInitialEvent event,
    Emitter<TwoFactorAuthenticationVerifyState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
  }
}
