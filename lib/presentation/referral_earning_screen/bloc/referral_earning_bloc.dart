import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/referral_earning_screen/models/referral_earning_model.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_resp.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
part 'referral_earning_event.dart';
part 'referral_earning_state.dart';

/// A bloc that manages the state of a ReferralEarning according to the event that is dispatched to it.
class ReferralEarningBloc
    extends Bloc<ReferralEarningEvent, ReferralEarningState> {
  ReferralEarningBloc(ReferralEarningState initialState) : super(initialState) {
    on<ReferralEarningInitialEvent>(_onInitialize);
    on<CreateTransferrecipientEvent>(_callCreateTransferRecipient);
  }

  final _repository = Repository();

  var postCreateTransferRecipientResp = PostCreateTransferRecipientResp();

  _onInitialize(
    ReferralEarningInitialEvent event,
    Emitter<ReferralEarningState> emit,
  ) async {}

  /// Calls [{{baseUrl}}/transferrecipient] with the provided event and emits the state.
  ///
  /// The [CreateTransferrecipientEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCreateTransferRecipient(
    CreateTransferrecipientEvent event,
    Emitter<ReferralEarningState> emit,
  ) async {
    var postCreateTransferRecipientReq = PostCreateTransferRecipientReq();
    await _repository.createTransferRecipient(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postCreateTransferRecipientReq.toJson(),
    ).then((value) async {
      postCreateTransferRecipientResp = value;
      _onCreateTransferRecipientSuccess(value, emit);
      event.onCreateTransferrecipientEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onCreateTransferRecipientError();
      event.onCreateTransferrecipientEventError?.call();
    });
  }

  void _onCreateTransferRecipientSuccess(
    PostCreateTransferRecipientResp resp,
    Emitter<ReferralEarningState> emit,
  ) {}
  void _onCreateTransferRecipientError() {
    //implement error method body...
  }
}
