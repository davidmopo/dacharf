import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/reward_screen/models/reward_model.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_resp.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
part 'reward_event.dart';
part 'reward_state.dart';

/// A bloc that manages the state of a Reward according to the event that is dispatched to it.
class RewardBloc extends Bloc<RewardEvent, RewardState> {
  RewardBloc(RewardState initialState) : super(initialState) {
    on<RewardInitialEvent>(_onInitialize);
    on<CreateTransferrecipientEvent>(_callCreateTransferRecipient);
  }

  final _repository = Repository();

  var postCreateTransferRecipientResp = PostCreateTransferRecipientResp();

  _onInitialize(
    RewardInitialEvent event,
    Emitter<RewardState> emit,
  ) async {}

  /// Calls [{{baseUrl}}/transferrecipient] with the provided event and emits the state.
  ///
  /// The [CreateTransferrecipientEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCreateTransferRecipient(
    CreateTransferrecipientEvent event,
    Emitter<RewardState> emit,
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
    Emitter<RewardState> emit,
  ) {}
  void _onCreateTransferRecipientError() {
    //implement error method body...
  }
}
