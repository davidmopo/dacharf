// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Profile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileEvent extends Equatable {}

/// Event that is dispatched when the Profile widget is first created.
class ProfileInitialEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://nodedemo.dhiwise.co/device/api/v1/user/update-profile API.
class UpdateUpdateProfileEvent extends ProfileEvent {
  UpdateUpdateProfileEvent();

  @override
  List<Object?> get props => [];
}
