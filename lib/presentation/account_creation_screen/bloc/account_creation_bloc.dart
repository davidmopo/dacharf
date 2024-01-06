import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/account_creation_screen/models/account_creation_model.dart';
part 'account_creation_event.dart';
part 'account_creation_state.dart';

/// A bloc that manages the state of a AccountCreation according to the event that is dispatched to it.
class AccountCreationBloc
    extends Bloc<AccountCreationEvent, AccountCreationState> {
  AccountCreationBloc(AccountCreationState initialState) : super(initialState) {
    on<AccountCreationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AccountCreationInitialEvent event,
    Emitter<AccountCreationState> emit,
  ) async {}
}
