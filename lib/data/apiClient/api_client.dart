import 'package:dio/dio.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/core/utils/progress_dialog_utils.dart';
import 'package:programming_s_application4/data/models/createCustomer/post_create_customer_resp.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_resp.dart';
import 'package:programming_s_application4/data/models/listUser/post_list_user_resp.dart';
import 'package:programming_s_application4/data/models/postCustomerIdentification/post_post_customer_identification_resp.dart';
import 'package:programming_s_application4/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:programming_s_application4/data/models/updateUserProfile/put_update_user_profile_resp.dart';

import 'network_interceptor.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = Get.find<EnvConfig>().config.baseUrl;

  var dhiwiseUrl = "https://nodedemo.dhiwise.co";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 60), headers: {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYTNmOTI0NTNjODViYzEyNjU4ZjNiZSIsInVzZXJuYW1lIjoiSnVkZ2VfQ3JvbmluIiwiaWF0IjoxNjcxNjk3MTcxfQ.hbZLKSsS6Mdj1ndhAf4rm_5we4iWYvKY1VPSo51sQRM",
    "Content-Type": "application/json"
  }))
        ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  /// Performs API call for {{baseUrl}}/transferrecipient
  ///
  /// Sends a POST request to the server's '{{baseUrl}}/transferrecipient' endpoint
  /// with the provided headers and request data
  /// Returns a [PostCreateTransferRecipientResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostCreateTransferRecipientResp> createTransferRecipient({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/transferrecipient',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostCreateTransferRecipientResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostCreateTransferRecipientResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for {{baseUrl}}/customer/:code/identification
  ///
  /// Sends a POST request to the server's '{{baseUrl}}/customer/:code/identification' endpoint
  /// with the provided headers and request data
  /// Returns a [PostPostCustomerIdentificationResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostPostCustomerIdentificationResp> postCustomerIdentification({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String? code = '',
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/customer/$code/identification',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPostCustomerIdentificationResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostPostCustomerIdentificationResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for {{baseUrl}}/customer
  ///
  /// Sends a POST request to the server's '{{baseUrl}}/customer' endpoint
  /// with the provided headers and request data
  /// Returns a [PostCreateCustomerResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostCreateCustomerResp> createCustomer(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/customer',
        data: requestData,
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostCreateCustomerResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostCreateCustomerResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://nodedemo.dhiwise.co/device/api/v1/user/list
  ///
  /// Sends a POST request to the server's 'https://nodedemo.dhiwise.co/device/api/v1/user/list' endpoint
  /// with the provided headers and request data
  /// Returns a [PostListUserResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostListUserResp> listUser({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$dhiwiseUrl/device/api/v1/user/list',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostListUserResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostListUserResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://nodedemo.dhiwise.co/device/api/v1/user/update-profile
  ///
  /// Sends a PUT request to the server's 'https://nodedemo.dhiwise.co/device/api/v1/user/update-profile' endpoint
  /// with the provided headers and request data
  /// Returns a [PutUpdateUserProfileResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PutUpdateUserProfileResp> updateUserProfile({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.put(
        '$dhiwiseUrl/device/api/v1/user/update-profile',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PutUpdateUserProfileResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PutUpdateUserProfileResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://nodedemo.dhiwise.co/device/auth/register
  ///
  /// Sends a POST request to the server's 'https://nodedemo.dhiwise.co/device/auth/register' endpoint
  /// with the provided headers and request data
  /// Returns a [PostRegisterDeviceAuthResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostRegisterDeviceAuthResp> registerDeviceAuth({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$dhiwiseUrl/device/auth/register',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostRegisterDeviceAuthResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostRegisterDeviceAuthResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
