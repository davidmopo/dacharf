import 'bloc/password_change_bloc.dart';
import 'models/password_change_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/core/utils/validation_functions.dart';
import 'package:programming_s_application4/widgets/app_bar/appbar_title_image.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:programming_s_application4/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class PasswordChangeScreen extends StatelessWidget {
  PasswordChangeScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<PasswordChangeBloc>(
        create: (context) => PasswordChangeBloc(
            PasswordChangeState(passwordChangeModelObj: PasswordChangeModel()))
          ..add(PasswordChangeInitialEvent()),
        child: PasswordChangeScreen());
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
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.h, vertical: 11.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 15.h),
                                      child: Text("lbl_change_password".tr,
                                          style: CustomTextStyles
                                              .headlineSmallLatoExtraBold))),
                              SizedBox(height: 42.v),
                              _buildChangePasswordForm(context),
                              SizedBox(height: 99.v),
                              _buildNewPasswordForm(context),
                              Spacer(),
                              SizedBox(height: 52.v),
                              CustomElevatedButton(
                                  height: 45.v,
                                  text: "lbl_change_password".tr,
                                  buttonTextStyle: CustomTextStyles
                                      .headlineSmallLigconsolataPrimaryContainer,
                                  onPressed: () {
                                    changePassword(context);
                                  })
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 81.v,
        centerTitle: true,
        title: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(width: double.maxFinite, child: Divider())),
          SizedBox(height: 51.v),
          AppbarTitleImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 25.h, right: 326.h),
              onTap: () {
                onTapArrowLeft(context);
              })
        ]),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildChangePasswordForm(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text("msg_current_password".tr,
              style: theme.textTheme.bodyMedium)),
      SizedBox(height: 4.v),
      BlocBuilder<PasswordChangeBloc, PasswordChangeState>(
          builder: (context, state) {
        return CustomTextFormField(
            controller: state.passwordController,
            suffix: InkWell(
                onTap: () {
                  context.read<PasswordChangeBloc>().add(
                      ChangePasswordVisibilityEvent(
                          value: !state.isShowPassword));
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 10.v, 14.h, 11.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgMdieyeBlack900,
                        height: 24.adaptSize,
                        width: 24.adaptSize))),
            suffixConstraints: BoxConstraints(maxHeight: 45.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: state.isShowPassword,
            borderDecoration: TextFormFieldStyleHelper.fillGrayTL10,
            fillColor: appTheme.gray30002);
      })
    ]);
  }

  /// Section Widget
  Widget _buildNewPasswordForm(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h),
          child:
              Text("lbl_new_password".tr, style: theme.textTheme.bodyMedium)),
      SizedBox(height: 4.v),
      BlocBuilder<PasswordChangeBloc, PasswordChangeState>(
          builder: (context, state) {
        return CustomTextFormField(
            controller: state.newpasswordController,
            textInputAction: TextInputAction.done,
            suffix: InkWell(
                onTap: () {
                  context.read<PasswordChangeBloc>().add(
                      ChangePasswordVisibilityEvent1(
                          value: !state.isShowPassword1));
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 10.v, 14.h, 11.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgMdieyeBlack900,
                        height: 24.adaptSize,
                        width: 24.adaptSize))),
            suffixConstraints: BoxConstraints(maxHeight: 45.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: state.isShowPassword1,
            borderDecoration: TextFormFieldStyleHelper.fillGrayTL10,
            fillColor: appTheme.gray30002);
      })
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the https://nodedemo.dhiwise.co/device/api/v1/user/list API and triggers a [CreateListEvent] event on the [PasswordChangeBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateListEvent] event on the [PasswordChangeBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  changePassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PasswordChangeBloc>().add(
            CreateListEvent(
              onCreateListEventSuccess: () {
                _onListUserEventSuccess(context);
              },
              onCreateListEventError: () {
                _onListUserEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  void _onListUserEventSuccess(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onListUserEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<PasswordChangeBloc>()
                .postListUserResp
                .status
                .toString() ??
            '');
  }
}
