import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:programming_s_application4/presentation/profile_screen/models/profile_model.dart';
import 'package:programming_s_application4/data/models/updateUserProfile/put_update_user_profile_resp.dart';
import 'package:programming_s_application4/data/models/updateUserProfile/put_update_user_profile_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
import 'package:programming_s_application4/core/constants/user.dart';
part 'profile_event.dart';
part 'profile_state.dart';

/// A bloc that manages the state of a Profile according to the event that is dispatched to it.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
    on<UpdateUpdateProfileEvent>(_callUpdateUserProfile);
  }

  final _repository = Repository();

  var putUpdateUserProfileResp = PutUpdateUserProfileResp();

  _onInitialize(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) async {}

  /// Calls [https://nodedemo.dhiwise.co/device/api/v1/user/update-profile] with the provided event and emits the state.
  ///
  /// The [UpdateUpdateProfileEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callUpdateUserProfile(
    UpdateUpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    var putUpdateUserProfileReq = PutUpdateUserProfileReq(
      name: User.user,
    );
    await _repository.updateUserProfile(
      headers: {},
      requestData: putUpdateUserProfileReq.toJson(),
    ).then((value) async {
      putUpdateUserProfileResp = value;
      _onUpdateUserProfileSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onUpdateUserProfileError();
    });
  }

  void _onUpdateUserProfileSuccess(
    PutUpdateUserProfileResp resp,
    Emitter<ProfileState> emit,
  ) {}
  void _onUpdateUserProfileError() {
    //implement error method body...
  }
}
