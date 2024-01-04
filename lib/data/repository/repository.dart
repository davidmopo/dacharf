import 'package:programming_s_application4/data/models/createCustomer/post_create_customer_resp.dart';
import 'package:programming_s_application4/data/models/createTransferRecipient/post_create_transfer_recipient_resp.dart';
import 'package:programming_s_application4/data/models/listUser/post_list_user_resp.dart';
import 'package:programming_s_application4/data/models/postCustomerIdentification/post_post_customer_identification_resp.dart';
import 'package:programming_s_application4/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:programming_s_application4/data/models/updateUserProfile/put_update_user_profile_resp.dart';

import '../apiClient/api_client.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

  Future<PostCreateTransferRecipientResp> createTransferRecipient({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.createTransferRecipient(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostPostCustomerIdentificationResp> postCustomerIdentification({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String? code = '',
  }) async {
    return await _apiClient.postCustomerIdentification(
      headers: headers,
      requestData: requestData,
      code: code,
    );
  }

  Future<PostCreateCustomerResp> createCustomer(
      {Map requestData = const {}}) async {
    return await _apiClient.createCustomer(
      requestData: requestData,
    );
  }

  Future<PostListUserResp> listUser({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.listUser(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PutUpdateUserProfileResp> updateUserProfile({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.updateUserProfile(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostRegisterDeviceAuthResp> registerDeviceAuth({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.registerDeviceAuth(
      headers: headers,
      requestData: requestData,
    );
  }
}
