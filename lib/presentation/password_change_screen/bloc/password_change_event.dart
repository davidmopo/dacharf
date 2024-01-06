// ignore_for_file: must_be_immutable

part of 'password_change_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PasswordChange widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PasswordChangeEvent extends Equatable {}

/// Event that is dispatched when the PasswordChange widget is first created.
class PasswordChangeInitialEvent extends PasswordChangeEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://nodedemo.dhiwise.co/device/api/v1/user/list API.
class CreateListEvent extends PasswordChangeEvent {
  CreateListEvent({
    this.onCreateListEventSuccess,
    this.onCreateListEventError,
  });

  Function? onCreateListEventSuccess;

  Function? onCreateListEventError;

  @override
  List<Object?> get props => [
        onCreateListEventSuccess,
        onCreateListEventError,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends PasswordChangeEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent1 extends PasswordChangeEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
