import 'bloc/reward_bloc.dart';
import 'models/reward_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:programming_s_application4/widgets/custom_icon_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RewardBloc>(
        create: (context) =>
            RewardBloc(RewardState(rewardModelObj: RewardModel()))
              ..add(RewardInitialEvent()),
        child: RewardScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardBloc, RewardState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 26.v),
                  child: Column(children: [
                    _buildReferralEarnings(context),
                    SizedBox(height: 55.v),
                    _buildGetNow(context),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 76.v,
        title: AppbarTitle(
            text: "lbl_rewards".tr, margin: EdgeInsets.only(left: 8.h)),
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildReferralEarnings(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Text("msg_referral_earnings".tr,
                  style: theme.textTheme.titleMedium)),
          SizedBox(height: 4.v),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 13.v),
              decoration: AppDecoration.fillGray200
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 7.v),
                                      child: CustomIconButton(
                                          height: 29.adaptSize,
                                          width: 29.adaptSize,
                                          padding: EdgeInsets.all(4.h),
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgGrommetIconsMoney))),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 8.h, top: 2.v),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("lbl_earnings".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeLancelot),
                                            SizedBox(height: 2.v),
                                            Text("msg_get_up_to_2_5_of".tr,
                                                style: CustomTextStyles
                                                    .bodySmallLatoBlack90002_1)
                                          ]))
                                ]))),
                    GestureDetector(
                        onTap: () {
                          get1(context);
                        },
                        child: Container(
                            width: 52.h,
                            margin: EdgeInsets.only(
                                left: 1.h, top: 7.v, bottom: 9.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.h, vertical: 2.v),
                            decoration: AppDecoration.fillPrimary.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Text("lbl_get_now".tr,
                                style: CustomTextStyles
                                    .bodySmallLangarPrimaryContainer)))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildGetNow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Text("lbl_daily_bonus".tr,
                  style: theme.textTheme.titleMedium)),
          SizedBox(height: 6.v),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 13.v),
              decoration: AppDecoration.fillGray200
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(left: 7.h, top: 1.v, bottom: 7.v),
                        child: CustomIconButton(
                            height: 29.adaptSize,
                            width: 29.adaptSize,
                            padding: EdgeInsets.all(4.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgTdesignMoney))),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h, top: 1.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_bonus".tr,
                                  style: CustomTextStyles.bodyLargeLancelot),
                              SizedBox(height: 4.v),
                              Text("msg_get_up_to_n200_bonus".tr,
                                  style: CustomTextStyles
                                      .bodySmallLatoBlack90002_1)
                            ])),
                    Spacer(),
                    CustomElevatedButton(
                        height: 21.v,
                        width: 52.h,
                        text: "lbl_get_now".tr,
                        margin: EdgeInsets.only(top: 7.v, bottom: 9.v),
                        buttonTextStyle:
                            CustomTextStyles.bodySmallLangarPrimaryContainer,
                        onPressed: () {
                          get(context);
                        })
                  ]))
        ]));
  }

  /// Calls the {{baseUrl}}/transferrecipient API and triggers a [CreateTransferrecipientEvent] event on the [RewardBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  get1(BuildContext context) {
    context.read<RewardBloc>().add(
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
      msg: "Successful",
    );
    Fluttertoast.showToast(
      msg: "Successful",
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateTransferRecipientEventError(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Error",
    );
    Fluttertoast.showToast(
      msg: "Error",
    );
  }

  /// Calls the {{baseUrl}}/transferrecipient API and triggers a [CreateTransferrecipientEvent] event on the [RewardBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  get(BuildContext context) {
    context.read<RewardBloc>().add(
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
