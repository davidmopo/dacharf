import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/investment_screen/models/investment_model.dart';
part 'investment_event.dart';
part 'investment_state.dart';

/// A bloc that manages the state of a Investment according to the event that is dispatched to it.
class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  InvestmentBloc(InvestmentState initialState) : super(initialState) {
    on<InvestmentInitialEvent>(_onInitialize);
  }

  _onInitialize(
    InvestmentInitialEvent event,
    Emitter<InvestmentState> emit,
  ) async {}
}
