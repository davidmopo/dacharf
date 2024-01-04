// ignore_for_file: must_be_immutable

part of 'reward_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Reward widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RewardEvent extends Equatable {}

/// Event that is dispatched when the Reward widget is first created.
class RewardInitialEvent extends RewardEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the {{baseUrl}}/transferrecipient API.
class CreateTransferrecipientEvent extends RewardEvent {
  CreateTransferrecipientEvent({
    this.onCreateTransferrecipientEventSuccess,
    this.onCreateTransferrecipientEventError,
  });

  Function? onCreateTransferrecipientEventSuccess;

  Function? onCreateTransferrecipientEventError;

  @override
  List<Object?> get props => [
        onCreateTransferrecipientEventSuccess,
        onCreateTransferrecipientEventError,
      ];
}
