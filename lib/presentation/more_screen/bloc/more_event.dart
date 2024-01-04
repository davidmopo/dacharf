// ignore_for_file: must_be_immutable

part of 'more_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///More widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MoreEvent extends Equatable {}

/// Event that is dispatched when the More widget is first created.
class MoreInitialEvent extends MoreEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://nodedemo.dhiwise.co/device/auth/register API.
class CreateRegisterEvent extends MoreEvent {
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
