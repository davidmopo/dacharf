import 'bloc/referral_earning_bloc.dart';
import 'models/referral_earning_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:programming_s_application4/widgets/custom_icon_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReferralEarningScreen extends StatelessWidget {
  const ReferralEarningScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ReferralEarningBloc>(
        create: (context) => ReferralEarningBloc(ReferralEarningState(
            referralEarningModelObj: ReferralEarningModel()))
          ..add(ReferralEarningInitialEvent()),
        child: ReferralEarningScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralEarningBloc, ReferralEarningState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle46,
                            height: 11.v,
                            width: 375.h),
                        SizedBox(height: 27.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 17.h, right: 160.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgArrowLeftBlack90003,
                                      height: 15.adaptSize,
                                      width: 15.adaptSize,
                                      margin: EdgeInsets.only(top: 3.v),
                                      onTap: () {
                                        onTapImgArrowLeft(context);
                                      }),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgIconoirCancel,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      margin: EdgeInsets.only(left: 10.h),
                                      onTap: () {
                                        onBackPressed(context);
                                      }),
                                  Spacer(),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 2.v),
                                      child: Text("lbl_earn_money".tr,
                                          style: CustomTextStyles
                                              .labelLargeLatoBlack9000213))
                                ]))),
                        SizedBox(height: 15.v),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 19.v),
                            decoration: AppDecoration.fillPrimary,
                            child: Column(children: [
                              _buildEarnNowStack(context),
                              SizedBox(height: 27.v),
                              _buildMyInvitationCodeColumn(context),
                              SizedBox(height: 15.v),
                              _buildHowToEarnColumn(context),
                              SizedBox(height: 33.v)
                            ])),
                        SizedBox(height: 5.v)
                      ])),
              bottomNavigationBar: _buildEarn200DailyBonusButton(context)));
    });
  }

  /// Section Widget
  Widget _buildEarnNowStack(BuildContext context) {
    return SizedBox(
        height: 192.v,
        width: 333.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 49.v),
                  child: Text("msg_invite_one_user_investor".tr,
                      style:
                          CustomTextStyles.bodyMediumLedgerPrimaryContainer))),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(left: 31.h, right: 34.h),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_refer_earn2".tr,
                            style: theme.textTheme.displaySmall),
                        SizedBox(height: 34.v),
                        Padding(
                            padding: EdgeInsets.only(left: 13.h),
                            child: Text("msg_2_5_on_every_investments".tr,
                                style:
                                    CustomTextStyles.displaySmallLeagueGothic)),
                        Padding(
                            padding: EdgeInsets.only(left: 13.h),
                            child: Text("msg_your_friends_can".tr,
                                style: CustomTextStyles
                                    .bodySmallLedgerPrimaryContainer)),
                        SizedBox(height: 27.v),
                        CustomElevatedButton(
                            height: 31.v,
                            width: 196.h,
                            text: "lbl_earn_now".tr,
                            buttonStyle: CustomButtonStyles.fillOrangeA,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallPrimaryContainer,
                            onPressed: () {
                              earn(context);
                            },
                            alignment: Alignment.center)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildMyInvitationCodeColumn(BuildContext context) {
    return Container(
        width: 365.h,
        padding: EdgeInsets.symmetric(horizontal: 109.h, vertical: 8.v),
        decoration: AppDecoration.fillPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
              alignment: Alignment.centerRight,
              child: Text("msg_my_invitation_code".tr,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 4.v),
          Text("lbl_42100".tr,
              style: CustomTextStyles.headlineLargeLatoPrimary),
          SizedBox(height: 7.v)
        ]));
  }

  /// Section Widget
  Widget _buildHowToEarnColumn(BuildContext context) {
    return Container(
        decoration: AppDecoration.fillPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Text("lbl_how_to_earn".tr,
                  style: CustomTextStyles.titleSmallBold),
              SizedBox(height: 13.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.only(left: 30.h, right: 9.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomIconButton(
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      padding: EdgeInsets.all(4.h),
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgMaterialSymbolsShare)),
                                  SizedBox(height: 3.v),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                          width: 25.h,
                                          child: Text("lbl_share_link".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: CustomTextStyles
                                                  .bodySmallLatoBlack9000210)))
                                ]),
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgHeroiconsArrowLeftSolid,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                margin: EdgeInsets.only(
                                    left: 28.h, top: 4.v, bottom: 34.v)),
                            Spacer(flex: 54),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 5.h),
                                      child: CustomIconButton(
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          padding: EdgeInsets.all(4.h),
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgTablerFriends))),
                                  SizedBox(height: 3.v),
                                  SizedBox(
                                      width: 60.h,
                                      child: Text("msg_friends_accepts".tr,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodySmallLatoBlack9000210))
                                ]),
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgHeroiconsArrowLeftSolid,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                margin: EdgeInsets.only(
                                    left: 10.h, top: 4.v, bottom: 34.v)),
                            Spacer(flex: 45),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 4.h),
                                      child: CustomIconButton(
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          padding: EdgeInsets.all(4.h),
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgTablerCurrencyNairaPrimary))),
                                  SizedBox(height: 3.v),
                                  SizedBox(
                                      width: 83.h,
                                      child: Text(
                                          "msg_friends_add_money_and".tr,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodySmallLatoBlack9000210))
                                ])
                          ]))),
              SizedBox(height: 8.v),
              Container(
                  width: 365.h,
                  padding: EdgeInsets.symmetric(horizontal: 33.h),
                  decoration: AppDecoration.fillBlueGray
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder7),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 1.v),
                        Text("msg_the_more_friends".tr,
                            style: CustomTextStyles.bodySmallLatoBlack90002)
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildEarn200DailyBonusButton(BuildContext context) {
    return CustomElevatedButton(
        height: 34.v,
        width: 196.h,
        text: "msg_earn_200_daily".tr,
        margin: EdgeInsets.only(left: 92.h, right: 87.h, bottom: 53.v),
        leftIcon: Container(
            margin: EdgeInsets.only(),
            child: CustomImageView(
                imagePath: ImageConstant.imgMdinaira,
                height: 12.adaptSize,
                width: 12.adaptSize)),
        buttonStyle: CustomButtonStyles.fillOrangeA,
        buttonTextStyle: CustomTextStyles.bodyLargeLeagueGothic,
        onPressed: () {
          earn1(context);
        });
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the previous screen.
  onBackPressed(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the {{baseUrl}}/transferrecipient API and triggers a [CreateTransferrecipientEvent] event on the [ReferralEarningBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  earn(BuildContext context) {
    context.read<ReferralEarningBloc>().add(
          CreateTransferrecipientEvent(
            onCreateTransferrecipientEventSuccess: () {
              _onCreateTransferRecipientEventSuccess(context);
            },
            onCreateTransferrecipientEventError: () {
              _onCreateTransferRecipientEventError(context);
            },
          ),
        );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateTransferRecipientEventSuccess(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Enjoy",
    );
    Fluttertoast.showToast(
      msg: "Enjoy",
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateTransferRecipientEventError(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Opps!",
    );
    Fluttertoast.showToast(
      msg: "Error",
    );
  }

  /// Calls the {{baseUrl}}/transferrecipient API and triggers a [CreateTransferrecipientEvent] event on the [ReferralEarningBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  earn1(BuildContext context) {
    context.read<ReferralEarningBloc>().add(
          CreateTransferrecipientEvent(
            onCreateTransferrecipientEventSuccess: () {
              _onCreateTransferRecipientEventSuccess(context);
            },
            onCreateTransferrecipientEventError: () {
              _onCreateTransferRecipientEventError(context);
            },
          ),
        );
  }
}
