// ignore_for_file: must_be_immutable

part of 'support_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Support widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SupportEvent extends Equatable {}

/// Event that is dispatched when the Support widget is first created.
class SupportInitialEvent extends SupportEvent {
  @override
  List<Object?> get props => [];
}
