import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/begin_screen/models/begin_model.dart';
part 'begin_event.dart';
part 'begin_state.dart';

/// A bloc that manages the state of a Begin according to the event that is dispatched to it.
class BeginBloc extends Bloc<BeginEvent, BeginState> {
  BeginBloc(BeginState initialState) : super(initialState) {
    on<BeginInitialEvent>(_onInitialize);
  }

  _onInitialize(
    BeginInitialEvent event,
    Emitter<BeginState> emit,
  ) async {
    emit(state.copyWith(
        lastNameController: TextEditingController(),
        egCounterController: TextEditingController()));
  }
}
