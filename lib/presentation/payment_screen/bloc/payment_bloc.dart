import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/payment_screen/models/payment_model.dart';
import 'package:programming_s_application4/data/models/postCustomerIdentification/post_post_customer_identification_resp.dart';
import 'package:programming_s_application4/data/models/postCustomerIdentification/post_post_customer_identification_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
import 'package:programming_s_application4/core/constants/user.dart';
part 'payment_event.dart';
part 'payment_state.dart';

/// A bloc that manages the state of a Payment according to the event that is dispatched to it.
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(PaymentState initialState) : super(initialState) {
    on<PaymentInitialEvent>(_onInitialize);
    on<CreateIdentificationEvent>(_callPostCustomerIdentification);
  }

  final _repository = Repository();

  var postPostCustomerIdentificationResp = PostPostCustomerIdentificationResp();

  _onInitialize(
    PaymentInitialEvent event,
    Emitter<PaymentState> emit,
  ) async {}

  /// Calls [{{baseUrl}}/customer/:code/identification] with the provided event and emits the state.
  ///
  /// The [CreateIdentificationEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callPostCustomerIdentification(
    CreateIdentificationEvent event,
    Emitter<PaymentState> emit,
  ) async {
    var postPostCustomerIdentificationReq = PostPostCustomerIdentificationReq();
    await _repository.postCustomerIdentification(
      headers: {
        'Content-type': 'application/json',
      },
      code: User.user,
      requestData: postPostCustomerIdentificationReq.toJson(),
    ).then((value) async {
      postPostCustomerIdentificationResp = value;
      _onPostCustomerIdentificationSuccess(value, emit);
      event.onCreateIdentificationEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onPostCustomerIdentificationError();
      event.onCreateIdentificationEventError?.call();
    });
  }

  void _onPostCustomerIdentificationSuccess(
    PostPostCustomerIdentificationResp resp,
    Emitter<PaymentState> emit,
  ) {}
  void _onPostCustomerIdentificationError() {
    //implement error method body...
  }
}
