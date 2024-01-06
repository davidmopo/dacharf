import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/more_screen/models/more_model.dart';
import 'package:programming_s_application4/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:programming_s_application4/data/models/registerDeviceAuth/post_register_device_auth_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
import 'package:programming_s_application4/core/constants/user.dart';
part 'more_event.dart';
part 'more_state.dart';

/// A bloc that manages the state of a More according to the event that is dispatched to it.
class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc(MoreState initialState) : super(initialState) {
    on<MoreInitialEvent>(_onInitialize);
    on<CreateRegisterEvent>(_callRegisterDeviceAuth);
  }

  final _repository = Repository();

  var postRegisterDeviceAuthResp = PostRegisterDeviceAuthResp();

  _onInitialize(
    MoreInitialEvent event,
    Emitter<MoreState> emit,
  ) async {}

  /// Calls [https://nodedemo.dhiwise.co/device/auth/register] with the provided event and emits the state.
  ///
  /// The [CreateRegisterEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callRegisterDeviceAuth(
    CreateRegisterEvent event,
    Emitter<MoreState> emit,
  ) async {
    var postRegisterDeviceAuthReq = PostRegisterDeviceAuthReq(
      username: User.user,
    );
    await _repository.registerDeviceAuth(
      headers: {},
      requestData: postRegisterDeviceAuthReq.toJson(),
    ).then((value) async {
      postRegisterDeviceAuthResp = value;
      _onRegisterDeviceAuthSuccess(value, emit);
      event.onCreateRegisterEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onRegisterDeviceAuthError();
      event.onCreateRegisterEventError?.call();
    });
  }

  void _onRegisterDeviceAuthSuccess(
    PostRegisterDeviceAuthResp resp,
    Emitter<MoreState> emit,
  ) {
    emit(
      state.copyWith(
        moreModelObj: state.moreModelObj?.copyWith(
          clarityLogoutLine: resp.message ?? '',
        ),
      ),
    );
  }

  void _onRegisterDeviceAuthError() {
    //implement error method body...
  }
}
