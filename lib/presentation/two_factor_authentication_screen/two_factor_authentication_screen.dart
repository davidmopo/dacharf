import 'bloc/two_factor_authentication_bloc.dart';
import 'models/two_factor_authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';

class TwoFactorAuthenticationScreen extends StatelessWidget {
  const TwoFactorAuthenticationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TwoFactorAuthenticationBloc>(
        create: (context) => TwoFactorAuthenticationBloc(
            TwoFactorAuthenticationState(
                twoFactorAuthenticationModelObj:
                    TwoFactorAuthenticationModel()))
          ..add(TwoFactorAuthenticationInitialEvent()),
        child: TwoFactorAuthenticationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TwoFactorAuthenticationBloc,
        TwoFactorAuthenticationState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 11.v,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary)),
                        SizedBox(height: 21.v),
                        Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Row(children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgArrowLeftBlack90003,
                                  height: 15.adaptSize,
                                  width: 15.adaptSize,
                                  margin: EdgeInsets.only(bottom: 2.v),
                                  onTap: () {
                                    onTapImgArrowLeft(context);
                                  }),
                              Padding(
                                  padding: EdgeInsets.only(left: 18.h),
                                  child: Text("lbl_settings".tr,
                                      style: theme.textTheme.bodyMedium))
                            ])),
                        SizedBox(height: 13.v),
                        Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text("msg_two_factor_authentication2".tr,
                                style: CustomTextStyles
                                    .headlineSmallLeagueGothic)),
                        SizedBox(height: 27.v),
                        _buildUserProfile(context),
                        Spacer(),
                        SizedBox(height: 99.v),
                        CustomElevatedButton(
                            height: 36.v,
                            width: 203.h,
                            text: "lbl_turn_off".tr,
                            buttonTextStyle: theme.textTheme.titleLarge!,
                            alignment: Alignment.center)
                      ]))));
    });
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 13.h),
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
            decoration: AppDecoration.fillBlueGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 88.v,
                      width: 101.h,
                      margin: EdgeInsets.only(bottom: 6.v),
                      child: Stack(alignment: Alignment.topCenter, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 55.v,
                            width: 101.h,
                            alignment: Alignment.bottomCenter),
                        CustomImageView(
                            imagePath: ImageConstant.imgVectorPrimary,
                            height: 44.v,
                            width: 101.h,
                            alignment: Alignment.topCenter)
                      ])),
                  Padding(
                      padding: EdgeInsets.fromLTRB(4.h, 4.v, 17.h, 8.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 15.h),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_sms".tr,
                                          style: CustomTextStyles
                                              .headlineSmallPoly),
                                      Container(
                                          height: 20.v,
                                          width: 60.h,
                                          margin: EdgeInsets.only(
                                              left: 5.h, bottom: 7.v),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        "lbl_enabled".tr,
                                                        style: CustomTextStyles
                                                            .bodyMediumPolyOnError)),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        height: 20.v,
                                                        width: 60.h,
                                                        decoration: BoxDecoration(
                                                            color: appTheme
                                                                .greenA70035,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.h))))
                                              ]))
                                    ])),
                            SizedBox(height: 6.v),
                            SizedBox(
                                width: 195.h,
                                child: Text("msg_you_will_receive".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .bodySmallPolyBlack90002
                                        .copyWith(height: 1.54)))
                          ]))
                ])));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
