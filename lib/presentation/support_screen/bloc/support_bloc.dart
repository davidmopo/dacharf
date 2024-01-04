import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/support_screen/models/support_model.dart';
part 'support_event.dart';
part 'support_state.dart';

/// A bloc that manages the state of a Support according to the event that is dispatched to it.
class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc(SupportState initialState) : super(initialState) {
    on<SupportInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SupportInitialEvent event,
    Emitter<SupportState> emit,
  ) async {}
}
