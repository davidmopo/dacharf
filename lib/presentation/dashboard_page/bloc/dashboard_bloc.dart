import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/referearnlist_item_model.dart';
import 'package:programming_s_application4/presentation/dashboard_page/models/dashboard_model.dart';
import 'package:programming_s_application4/data/models/createCustomer/post_create_customer_resp.dart';
import 'package:programming_s_application4/data/models/createCustomer/post_create_customer_req.dart';
import 'dart:async';
import 'package:programming_s_application4/data/repository/repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:programming_s_application4/data/models/updateUserProfile/put_update_user_profile_resp.dart';
import 'package:programming_s_application4/data/models/updateUserProfile/put_update_user_profile_req.dart';
import 'package:programming_s_application4/core/constants/user.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_resp.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_req.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// A bloc that manages the state of a Dashboard according to the event that is dispatched to it.

// ignore_for_file: must_be_immutable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(DashboardState initialState) : super(initialState) {
    on<DashboardInitialEvent>(_onInitialize);
    on<CreateCustomerEvent>(_callCreateCustomer);
    on<UpdateUpdateProfileEvent>(_callUpdateUserProfile);
    on<CreateTransferrecipientEvent>(_callCreateTransferRecipient);
  }

  final _repository = Repository();

  var postCreateCustomerResp = PostCreateCustomerResp();

  var putUpdateUserProfileResp = PutUpdateUserProfileResp();

  var postCreateTransferRecipientResp = PostCreateTransferRecipientResp();

  /// Calls the {{baseUrl}}/customer API and triggers a [CreateCustomerEvent] event on the [DashboardBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
    DashboardInitialEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
        dashboardModelObj: state.dashboardModelObj
            ?.copyWith(referearnlistItemList: fillReferearnlistItemList())));
    add(CreateCustomerEvent(onCreateCustomerEventSuccess: () {
      _onCreateCustomerEventSuccess();
    }, onCreateCustomerEventError: () {
      _onCreateCustomerEventError();
    }));
    NavigatorService.popAndPushNamed(AppRoutes.dashboardContainerScreen);
  }

  List<ReferearnlistItemModel> fillReferearnlistItemList() {
    return [
      ReferearnlistItemModel(
          referImage: ImageConstant.imgHealthiconsReferral,
          referText: "Refer & Earn",
          cashbackText: "Earn 5% Cashback per referral"),
      ReferearnlistItemModel(
          referImage: ImageConstant.imgIcOutlineInterests,
          referText: "Bonus with Daily Interest",
          cashbackText: "Enjoy daily interest with #200  daily bonus  ")
    ];
  }

  /// Calls [{{baseUrl}}/customer] with the provided event and emits the state.
  ///
  /// The [CreateCustomerEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCreateCustomer(
    CreateCustomerEvent event,
    Emitter<DashboardState> emit,
  ) async {
    var postCreateCustomerReq = PostCreateCustomerReq();
    await _repository
        .createCustomer(requestData: postCreateCustomerReq.toJson())
        .then((value) async {
      postCreateCustomerResp = value;
      _onCreateCustomerSuccess(value, emit);
      event.onCreateCustomerEventSuccess?.call();
    }).onError((error, stackTrace) {
      _onCreateCustomerError();
      event.onCreateCustomerEventError?.call();
    });
  }

  void _onCreateCustomerSuccess(
    PostCreateCustomerResp resp,
    Emitter<DashboardState> emit,
  ) {}
  void _onCreateCustomerError() {}
  void _onCreateCustomerEventSuccess() {}

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateCustomerEventError() {
    Fluttertoast.showToast(msg: "try again");
  }

  /// Calls [https://nodedemo.dhiwise.co/device/api/v1/user/update-profile] with the provided event and emits the state.
  ///
  /// The [UpdateUpdateProfileEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callUpdateUserProfile(
    UpdateUpdateProfileEvent event,
    Emitter<DashboardState> emit,
  ) async {
    var putUpdateUserProfileReq = PutUpdateUserProfileReq(name: User.user);
    await _repository.updateUserProfile(
        headers: {},
        requestData: putUpdateUserProfileReq.toJson()).then((value) async {
      putUpdateUserProfileResp = value;
      _onUpdateUserProfileSuccess(value, emit);
    }).onError((error, stackTrace) {
      _onUpdateUserProfileError();
    });
  }

  void _onUpdateUserProfileSuccess(
    PutUpdateUserProfileResp resp,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(
        dashboardModelObj:
            state.dashboardModelObj?.copyWith(hi: resp.status ?? '')));
  }

  void _onUpdateUserProfileError() {}

  /// Calls [{{baseUrl}}/transferrecipient] with the provided event and emits the state.
  ///
  /// The [CreateTransferrecipientEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCreateTransferRecipient(
    CreateTransferrecipientEvent event,
    Emitter<DashboardState> emit,
  ) async {
    var postCreateTransferRecipientReq = PostCreateTransferRecipientReq();
    await _repository.createTransferRecipient(
        headers: {'Content-type': 'application/json'},
        requestData:
            postCreateTransferRecipientReq.toJson()).then((value) async {
      postCreateTransferRecipientResp = value;
      _onCreateTransferRecipientSuccess(value, emit);
      event.onCreateTransferrecipientEventSuccess?.call();
    }).onError((error, stackTrace) {
      _onCreateTransferRecipientError();
      event.onCreateTransferrecipientEventError?.call();
    });
  }

  void _onCreateTransferRecipientSuccess(
    PostCreateTransferRecipientResp resp,
    Emitter<DashboardState> emit,
  ) {}
  void _onCreateTransferRecipientError() {}
}
