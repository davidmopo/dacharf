import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/get_started_screen/models/get_started_model.dart';
import 'package:programming_s_application4/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:programming_s_application4/data/models/registerDeviceAuth/post_register_device_auth_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
part 'get_started_event.dart';
part 'get_started_state.dart';

/// A bloc that manages the state of a GetStarted according to the event that is dispatched to it.
class GetStartedBloc extends Bloc<GetStartedEvent, GetStartedState> {
  GetStartedBloc(GetStartedState initialState) : super(initialState) {
    on<GetStartedInitialEvent>(_onInitialize);
    on<CreateRegisterEvent>(_callRegisterDeviceAuth);
  }

  final _repository = Repository();

  var postRegisterDeviceAuthResp = PostRegisterDeviceAuthResp();

  _onInitialize(
    GetStartedInitialEvent event,
    Emitter<GetStartedState> emit,
  ) async {
    emit(state.copyWith(
        phoneNumberController: TextEditingController(),
        passwordController: TextEditingController(),
        passwordController1: TextEditingController(),
        emailController: TextEditingController()));
  }

  /// Calls [https://nodedemo.dhiwise.co/device/auth/register] with the provided event and emits the state.
  ///
  /// The [CreateRegisterEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callRegisterDeviceAuth(
    CreateRegisterEvent event,
    Emitter<GetStartedState> emit,
  ) async {
    var postRegisterDeviceAuthReq = PostRegisterDeviceAuthReq(
      username: state.phoneNumberController?.text ?? '',
      password: state.passwordController?.text ?? '',
      email: state.emailController?.text ?? '',
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
    Emitter<GetStartedState> emit,
  ) {
    emit(
      state.copyWith(
        getStartedModelObj: state.getStartedModelObj?.copyWith(
          passwordController1: resp.data?.password ?? '',
        ),
        emailController:
            TextEditingController(text: resp.data!.username! ?? ''),
      ),
    );
  }

  void _onRegisterDeviceAuthError() {
    //implement error method body...
  }
}
