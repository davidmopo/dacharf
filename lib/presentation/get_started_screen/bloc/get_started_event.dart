// ignore_for_file: must_be_immutable

part of 'get_started_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///GetStarted widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class GetStartedEvent extends Equatable {}

/// Event that is dispatched when the GetStarted widget is first created.
class GetStartedInitialEvent extends GetStartedEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://nodedemo.dhiwise.co/device/auth/register API.
class CreateRegisterEvent extends GetStartedEvent {
  CreateRegisterEvent({
    this.onCreateRegisterEventSuccess,
    this.onCreateRegisterEventError,
  });

  Function? onCreateRegisterEventSuccess;

  Function? onCreateRegisterEventError;

  @override
  List<Object?> get props => [
        onCreateRegisterEventSuccess,
        onCreateRegisterEventError,
      ];
}
