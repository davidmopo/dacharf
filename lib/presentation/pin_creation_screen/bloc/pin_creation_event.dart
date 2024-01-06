// ignore_for_file: must_be_immutable

part of 'pin_creation_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PinCreation widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PinCreationEvent extends Equatable {}

/// Event that is dispatched when the PinCreation widget is first created.
class PinCreationInitialEvent extends PinCreationEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends PinCreationEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
