// ignore_for_file: must_be_immutable

part of 'account_creation_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AccountCreation widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AccountCreationEvent extends Equatable {}

/// Event that is dispatched when the AccountCreation widget is first created.
class AccountCreationInitialEvent extends AccountCreationEvent {
  @override
  List<Object?> get props => [];
}
