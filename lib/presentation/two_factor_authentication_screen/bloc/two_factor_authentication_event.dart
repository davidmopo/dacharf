// ignore_for_file: must_be_immutable

part of 'two_factor_authentication_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TwoFactorAuthentication widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TwoFactorAuthenticationEvent extends Equatable {}

/// Event that is dispatched when the TwoFactorAuthentication widget is first created.
class TwoFactorAuthenticationInitialEvent extends TwoFactorAuthenticationEvent {
  @override
  List<Object?> get props => [];
}
