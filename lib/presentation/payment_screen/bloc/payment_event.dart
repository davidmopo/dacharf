// ignore_for_file: must_be_immutable

part of 'payment_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Payment widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PaymentEvent extends Equatable {}

/// Event that is dispatched when the Payment widget is first created.
class PaymentInitialEvent extends PaymentEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the {{baseUrl}}/customer/:code/identification API.
class CreateIdentificationEvent extends PaymentEvent {
  CreateIdentificationEvent({
    this.onCreateIdentificationEventSuccess,
    this.onCreateIdentificationEventError,
  });

  Function? onCreateIdentificationEventSuccess;

  Function? onCreateIdentificationEventError;

  @override
  List<Object?> get props => [
        onCreateIdentificationEventSuccess,
        onCreateIdentificationEventError,
      ];
}
