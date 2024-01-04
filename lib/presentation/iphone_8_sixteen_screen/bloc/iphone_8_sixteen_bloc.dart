import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/iphone_8_sixteen_screen/models/iphone_8_sixteen_model.dart';
part 'iphone_8_sixteen_event.dart';
part 'iphone_8_sixteen_state.dart';

/// A bloc that manages the state of a Iphone8Sixteen according to the event that is dispatched to it.
class Iphone8SixteenBloc
    extends Bloc<Iphone8SixteenEvent, Iphone8SixteenState> {
  Iphone8SixteenBloc(Iphone8SixteenState initialState) : super(initialState) {
    on<Iphone8SixteenInitialEvent>(_onInitialize);
  }

  _onInitialize(
    Iphone8SixteenInitialEvent event,
    Emitter<Iphone8SixteenState> emit,
  ) async {}
}
