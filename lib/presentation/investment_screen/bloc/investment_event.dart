// ignore_for_file: must_be_immutable

part of 'investment_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Investment widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class InvestmentEvent extends Equatable {}

/// Event that is dispatched when the Investment widget is first created.
class InvestmentInitialEvent extends InvestmentEvent {
  @override
  List<Object?> get props => [];
}
