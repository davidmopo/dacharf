import 'bloc/more_bloc.dart';
import 'models/more_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MoreBloc>(
        create: (context) => MoreBloc(MoreState(moreModelObj: MoreModel()))
          ..add(MoreInitialEvent()),
        child: MoreScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreBloc, MoreState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    Divider(),
                    SizedBox(height: 22.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Text("lbl_explore".tr,
                                style: CustomTextStyles
                                    .headlineSmallLeagueSpartan))),
                    SizedBox(height: 15.v),
                    _buildYourProfileSection(context),
                    SizedBox(height: 17.v),
                    _buildSecuritySection(context),
                    SizedBox(height: 34.v),
                    GestureDetector(
                        onTap: () {
                          logOut(context);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.v, bottom: 8.v),
                                  child: Text("lbl_log_out".tr,
                                      style: CustomTextStyles
                                          .titleSmallExtraBold)),
                              CustomImageView(
                                  imagePath:
                                      state.moreModelObj?.clarityLogoutLine,
                                  height: 36.adaptSize,
                                  width: 36.adaptSize)
                            ])),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildYourProfileSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text("lbl_your_account".tr,
                  style: CustomTextStyles.bodyMediumLaoSansPro)),
          SizedBox(height: 10.v),
          Container(
              padding: EdgeInsets.all(18.h),
              decoration: AppDecoration.fillGray200
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgMaterialSymbolsPerson,
                              height: 25.adaptSize,
                              width: 25.adaptSize,
                              onTap: () {
                                profile(context);
                              }),
                          GestureDetector(
                              onTap: () {
                                profile1(context);
                              },
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 12.h, bottom: 7.v),
                                  child: Text("lbl_your_profile".tr,
                                      style: CustomTextStyles.bodyMedium14)))
                        ]),
                    SizedBox(height: 34.v),
                    Padding(
                        padding: EdgeInsets.only(left: 3.h, right: 1.h),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgUiwVerification,
                                  height: 25.adaptSize,
                                  width: 25.adaptSize,
                                  onTap: () {
                                    verify(context);
                                  }),
                              GestureDetector(
                                  onTap: () {
                                    factor1(context);
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 13.h, bottom: 7.v),
                                      child: Text("msg_account_verification".tr,
                                          style:
                                              CustomTextStyles.bodyMedium14))),
                              Spacer(),
                              CustomElevatedButton(
                                  height: 24.v,
                                  width: 61.h,
                                  text: "lbl_verified".tr,
                                  buttonStyle: CustomButtonStyles.fillGreenA,
                                  buttonTextStyle:
                                      CustomTextStyles.bodyMediumOnError,
                                  onPressed: () {
                                    factor(context);
                                  })
                            ])),
                    SizedBox(height: 30.v),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgCarbonNotification,
                              height: 25.adaptSize,
                              width: 25.adaptSize,
                              onTap: () {
                                notify(context);
                              }),
                          GestureDetector(
                              onTap: () {
                                notify1(context);
                              },
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, bottom: 7.v),
                                  child: Text("lbl_notification".tr,
                                      style: CustomTextStyles.bodyMedium14)))
                        ]),
                    SizedBox(height: 3.v)
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildSecuritySection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text("lbl_security".tr,
                  style: CustomTextStyles.bodyMediumLaoSansPro)),
          SizedBox(height: 9.v),
          Container(
              width: 361.h,
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.v),
              decoration: AppDecoration.fillGray200
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgSolarKeyBold,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  onTap: () {
                                    password(context);
                                  }),
                              GestureDetector(
                                  onTap: () {
                                    password1(context);
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.h, top: 2.v, bottom: 4.v),
                                      child: Text("lbl_change_password".tr,
                                          style:
                                              CustomTextStyles.bodyMedium14)))
                            ])),
                    SizedBox(height: 31.v),
                    Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgCarbonTwoFact,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  onTap: () {
                                    pin(context);
                                  }),
                              GestureDetector(
                                  onTap: () {
                                    pin1(context);
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 13.h, bottom: 5.v),
                                      child: Text("lbl_change_your_pin".tr,
                                          style:
                                              CustomTextStyles.bodyMedium14)))
                            ])),
                    SizedBox(height: 31.v),
                    Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgUisPadlock,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  onTap: () {
                                    factorAuth(context);
                                  }),
                              GestureDetector(
                                  onTap: () {
                                    factorAutho(context);
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 14.h, bottom: 5.v),
                                      child: Text(
                                          "msg_two_factor_authentication".tr,
                                          style:
                                              CustomTextStyles.bodyMedium14)))
                            ])),
                    SizedBox(height: 31.v),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgFluentPersonSPrimary,
                              height: 28.adaptSize,
                              width: 28.adaptSize,
                              onTap: () {
                                support(context);
                              }),
                          GestureDetector(
                              onTap: () {
                                support1(context);
                              },
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 12.h, bottom: 9.v),
                                  child: Text("lbl_contact_support".tr,
                                      style: CustomTextStyles.bodyMedium14)))
                        ]),
                    SizedBox(height: 7.v)
                  ]))
        ]));
  }

  /// Navigates to the profileScreen when the action is triggered.
  profile(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  profile1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the twoFactorAuthenticationScreen when the action is triggered.
  verify(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.twoFactorAuthenticationScreen,
    );
  }

  /// Navigates to the twoFactorAuthenticationScreen when the action is triggered.
  factor1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.twoFactorAuthenticationScreen,
    );
  }

  /// Navigates to the twoFactorAuthenticationScreen when the action is triggered.
  factor(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.twoFactorAuthenticationScreen,
    );
  }

  /// Navigates to the notificationScreen when the action is triggered.
  notify(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the notificationScreen when the action is triggered.
  notify1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the passwordChangeScreen when the action is triggered.
  password(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.passwordChangeScreen,
    );
  }

  /// Navigates to the passwordChangeScreen when the action is triggered.
  password1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.passwordChangeScreen,
    );
  }

  /// Navigates to the pinCreationScreen when the action is triggered.
  pin(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.pinCreationScreen,
    );
  }

  /// Navigates to the pinCreationScreen when the action is triggered.
  pin1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.pinCreationScreen,
    );
  }

  /// Navigates to the twoFactorAuthenticationVerifyScreen when the action is triggered.
  factorAuth(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.twoFactorAuthenticationVerifyScreen,
    );
  }

  /// Navigates to the twoFactorAuthenticationVerifyScreen when the action is triggered.
  factorAutho(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.twoFactorAuthenticationVerifyScreen,
    );
  }

  /// Navigates to the supportScreen when the action is triggered.
  support(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.supportScreen,
    );
  }

  /// Navigates to the supportScreen when the action is triggered.
  support1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.supportScreen,
    );
  }

  /// Calls the https://nodedemo.dhiwise.co/device/auth/register API and triggers a [CreateRegisterEvent] event on the [MoreBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  logOut(BuildContext context) {
    context.read<MoreBloc>().add(
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

  /// Navigates to the accountCreationScreen when the action is triggered.
  void _onRegisterDeviceAuthEventSuccess(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.accountCreationScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onRegisterDeviceAuthEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<MoreBloc>()
                .postRegisterDeviceAuthResp
                .status
                .toString() ??
            '');
  }
}
