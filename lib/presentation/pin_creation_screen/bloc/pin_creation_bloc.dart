import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/pin_creation_screen/models/pin_creation_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'pin_creation_event.dart';
part 'pin_creation_state.dart';

/// A bloc that manages the state of a PinCreation according to the event that is dispatched to it.
class PinCreationBloc extends Bloc<PinCreationEvent, PinCreationState>
    with CodeAutoFill {
  PinCreationBloc(PinCreationState initialState) : super(initialState) {
    on<PinCreationInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<PinCreationState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    PinCreationInitialEvent event,
    Emitter<PinCreationState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
