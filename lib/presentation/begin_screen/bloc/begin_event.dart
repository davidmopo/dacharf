// ignore_for_file: must_be_immutable

part of 'begin_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Begin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class BeginEvent extends Equatable {}

/// Event that is dispatched when the Begin widget is first created.
class BeginInitialEvent extends BeginEvent {
  @override
  List<Object?> get props => [];
}
