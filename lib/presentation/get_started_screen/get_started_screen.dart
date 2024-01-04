import 'bloc/get_started_bloc.dart';
import 'models/get_started_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/core/utils/validation_functions.dart';
import 'package:programming_s_application4/widgets/app_bar/appbar_title_image.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:programming_s_application4/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<GetStartedBloc>(
        create: (context) => GetStartedBloc(
            GetStartedState(getStartedModelObj: GetStartedModel()))
          ..add(GetStartedInitialEvent()),
        child: GetStartedScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(children: [
                              SizedBox(height: 25.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 21.h),
                                      child: Row(children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 1.v),
                                            child: Text(
                                                "msg_let_s_get_started".tr,
                                                style: CustomTextStyles
                                                    .headlineSmallBold)),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgOverflowMenuOnerror,
                                            height: 29.adaptSize,
                                            width: 29.adaptSize,
                                            margin: EdgeInsets.only(
                                                left: 4.h, bottom: 3.v))
                                      ]))),
                              SizedBox(height: 5.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      width: 311.h,
                                      margin: EdgeInsets.only(
                                          left: 15.h, right: 49.h),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "msg_register_to_start2".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumLight),
                                            TextSpan(
                                                text: "lbl_dacharf_today".tr,
                                                style: CustomTextStyles
                                                    .labelLargeLatoBlack90002)
                                          ]),
                                          textAlign: TextAlign.left))),
                              SizedBox(height: 58.v),
                              _buildPhoneNumberColumn(context),
                              SizedBox(height: 42.v),
                              _buildPasswordColumn(context),
                              SizedBox(height: 42.v),
                              _buildReTypePasswordColumn(context),
                              SizedBox(height: 34.v),
                              _buildEmailColumn(context),
                              SizedBox(height: 5.v),
                              CustomElevatedButton(
                                  text: "msg_create_your_free".tr,
                                  margin:
                                      EdgeInsets.only(left: 15.h, right: 27.h),
                                  buttonStyle: CustomButtonStyles.fillPrimary,
                                  onPressed: () {
                                    signUp(context);
                                  },
                                  alignment: Alignment.centerLeft),
                              SizedBox(height: 6.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 1119.h),
                                      child: Row(children: [
                                        Text("msg_this_form_is_encrypted".tr,
                                            style: CustomTextStyles
                                                .bodySmallOoohBabyBlack90002),
                                        Container(
                                            height: 10.v,
                                            width: 9.h,
                                            margin: EdgeInsets.only(
                                                left: 5.h, bottom: 3.v),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.h, vertical: 2.v),
                                            decoration: AppDecoration
                                                .fillBlueGray
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder4),
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgAkarIconsCheckPrimary,
                                                height: 6.v,
                                                width: 7.h,
                                                alignment: Alignment.center))
                                      ]))),
                              SizedBox(height: 31.v),
                              Container(
                                  height: 7.v,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.primary))
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarTitleImage(imagePath: ImageConstant.imgRectangle1014x375));
  }

  /// Section Widget
  Widget _buildPhoneNumberColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_phone_number".tr, style: theme.textTheme.labelLarge),
          SizedBox(height: 4.v),
          Padding(
              padding: EdgeInsets.only(right: 12.h),
              child: BlocSelector<GetStartedBloc, GetStartedState,
                      TextEditingController?>(
                  selector: (state) => state.phoneNumberController,
                  builder: (context, phoneNumberController) {
                    return CustomTextFormField(
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value == null ||
                              (!isMobileNumber(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_mobile_number"
                                .tr;
                          }
                          return null;
                        });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildPasswordColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_create_a_password".tr, style: theme.textTheme.labelLarge),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(right: 12.h),
              child: BlocSelector<GetStartedBloc, GetStartedState,
                      TextEditingController?>(
                  selector: (state) => state.passwordController,
                  builder: (context, passwordController) {
                    return CustomTextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (!isValidPassword(value)) {
                            return "err_msg_please_enter_valid_password".tr;
                          }
                          return null;
                        },
                        obscureText: true);
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildReTypePasswordColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 11.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text("msg_re_type_password".tr,
                  style: theme.textTheme.labelLarge)),
          SizedBox(height: 8.v),
          Padding(
              padding: EdgeInsets.only(right: 20.h),
              child: BlocSelector<GetStartedBloc, GetStartedState,
                      TextEditingController?>(
                  selector: (state) => state.passwordController1,
                  builder: (context, passwordController1) {
                    return CustomTextFormField(
                        controller: passwordController1, obscureText: true);
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildEmailColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_email_address".tr, style: theme.textTheme.labelLarge),
          SizedBox(height: 6.v),
          Padding(
              padding: EdgeInsets.only(right: 12.h),
              child: BlocSelector<GetStartedBloc, GetStartedState,
                      TextEditingController?>(
                  selector: (state) => state.emailController,
                  builder: (context, emailController) {
                    return CustomTextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        });
                  }))
        ]));
  }

  /// Calls the https://nodedemo.dhiwise.co/device/auth/register API and triggers a [CreateRegisterEvent] event on the [GetStartedBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateRegisterEvent] event on the [GetStartedBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<GetStartedBloc>().add(
            CreateRegisterEvent(
              onCreateRegisterEventSuccess: () {
                _onRegisterDeviceAuthEventSuccess(context);
              },
              onCreateRegisterEventError: () {
                _onRegisterDeviceAuthEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  void _onRegisterDeviceAuthEventSuccess(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onRegisterDeviceAuthEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<GetStartedBloc>()
                .postRegisterDeviceAuthResp
                .status
                .toString() ??
            '');
  }
}
