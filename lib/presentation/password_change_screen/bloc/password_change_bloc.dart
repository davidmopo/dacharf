import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/password_change_screen/models/password_change_model.dart';
import 'package:programming_s_application4/data/models/listUser/post_list_user_resp.dart';
import 'package:programming_s_application4/data/models/listUser/post_list_user_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
part 'password_change_event.dart';
part 'password_change_state.dart';

/// A bloc that manages the state of a PasswordChange according to the event that is dispatched to it.
class PasswordChangeBloc
    extends Bloc<PasswordChangeEvent, PasswordChangeState> {
  PasswordChangeBloc(PasswordChangeState initialState) : super(initialState) {
    on<PasswordChangeInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<CreateListEvent>(_callListUser);
  }

  final _repository = Repository();

  var postListUserResp = PostListUserResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<PasswordChangeState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<PasswordChangeState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _onInitialize(
    PasswordChangeInitialEvent event,
    Emitter<PasswordChangeState> emit,
  ) async {
    emit(state.copyWith(
        passwordController: TextEditingController(),
        newpasswordController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true));
  }

  /// Calls [https://nodedemo.dhiwise.co/device/api/v1/user/list] with the provided event and emits the state.
  ///
  /// The [CreateListEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callListUser(
    CreateListEvent event,
    Emitter<PasswordChangeState> emit,
  ) async {
    var postListUserReq = PostListUserReq(
      options: Options(
        page: int.tryParse(state.newpasswordController?.text ?? ''),
      ),
    );
    await _repository.listUser(
      headers: {},
      requestData: postListUserReq.toJson(),
    ).then((value) async {
      postListUserResp = value;
      _onListUserSuccess(value, emit);
      event.onCreateListEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onListUserError();
      event.onCreateListEventError?.call();
    });
  }

  void _onListUserSuccess(
    PostListUserResp resp,
    Emitter<PasswordChangeState> emit,
  ) {
    emit(
      state.copyWith(
        passwordChangeModelObj: state.passwordChangeModelObj?.copyWith(),
        newpasswordController: TextEditingController(text: resp.message! ?? ''),
      ),
    );
  }

  void _onListUserError() {
    //implement error method body...
  }
}
