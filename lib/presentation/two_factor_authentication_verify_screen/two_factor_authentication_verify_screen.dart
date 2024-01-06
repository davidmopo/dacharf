import 'bloc/two_factor_authentication_verify_bloc.dart';
import 'models/two_factor_authentication_verify_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/app_bar/appbar_title_image.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:programming_s_application4/widgets/custom_pin_code_text_field.dart';

class TwoFactorAuthenticationVerifyScreen extends StatelessWidget {
  const TwoFactorAuthenticationVerifyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TwoFactorAuthenticationVerifyBloc>(
        create: (context) => TwoFactorAuthenticationVerifyBloc(
            TwoFactorAuthenticationVerifyState(
                twoFactorAuthenticationVerifyModelObj:
                    TwoFactorAuthenticationVerifyModel()))
          ..add(TwoFactorAuthenticationVerifyInitialEvent()),
        child: TwoFactorAuthenticationVerifyScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 21.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 6.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowLeftBlack90003,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                margin: EdgeInsets.only(bottom: 1.v),
                                onTap: () {
                                  onTapImgArrowLeft(context);
                                }),
                            Padding(
                                padding: EdgeInsets.only(left: 7.h),
                                child: Text("msg_two_factor_authentication2".tr,
                                    style: theme.textTheme.bodyMedium))
                          ])),
                      SizedBox(height: 14.v),
                      Padding(
                          padding: EdgeInsets.only(left: 6.h),
                          child: Text("lbl_disable_via_sms".tr,
                              style:
                                  CustomTextStyles.headlineSmallLeagueGothic)),
                      SizedBox(height: 39.v),
                      _buildOtpView(context),
                      Spacer(),
                      SizedBox(height: 78.v),
                      CustomElevatedButton(
                          height: 36.v,
                          width: 203.h,
                          text: "lbl_continue".tr,
                          buttonTextStyle: theme.textTheme.titleLarge!,
                          alignment: Alignment.center)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 11.v,
        centerTitle: true,
        title: AppbarTitleImage(imagePath: ImageConstant.imgRectangle461));
  }

  /// Section Widget
  Widget _buildOtpView(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 16.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 193.h,
                  margin: EdgeInsets.only(left: 39.h, right: 41.h),
                  child: Text("msg_enter_the_4_digit".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMedium15
                          .copyWith(height: 1.67))),
              SizedBox(height: 19.v),
              Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: BlocSelector<
                          TwoFactorAuthenticationVerifyBloc,
                          TwoFactorAuthenticationVerifyState,
                          TextEditingController?>(
                      selector: (state) => state.otpController,
                      builder: (context, otpController) {
                        return CustomPinCodeTextField(
                            context: context,
                            controller: otpController,
                            onChanged: (value) {
                              otpController?.text = value;
                            });
                      })),
              SizedBox(height: 19.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgLucideSendToBack,
                    height: 15.adaptSize,
                    width: 15.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v)),
                Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Text("lbl_resend_code".tr,
                        style: CustomTextStyles.bodyMediumPrimary))
              ]),
              SizedBox(height: 4.v)
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
