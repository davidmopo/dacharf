import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/about_us_screen/models/about_us_model.dart';
part 'about_us_event.dart';
part 'about_us_state.dart';

/// A bloc that manages the state of a AboutUs according to the event that is dispatched to it.
class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc(AboutUsState initialState) : super(initialState) {
    on<AboutUsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AboutUsInitialEvent event,
    Emitter<AboutUsState> emit,
  ) async {}
}
