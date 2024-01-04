// ignore_for_file: must_be_immutable

part of 'referral_earning_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ReferralEarning widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReferralEarningEvent extends Equatable {}

/// Event that is dispatched when the ReferralEarning widget is first created.
class ReferralEarningInitialEvent extends ReferralEarningEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the {{baseUrl}}/transferrecipient API.
class CreateTransferrecipientEvent extends ReferralEarningEvent {
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
