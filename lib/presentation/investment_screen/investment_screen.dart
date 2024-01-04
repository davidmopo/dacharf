import 'bloc/investment_bloc.dart';
import 'models/investment_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<InvestmentBloc>(
        create: (context) => InvestmentBloc(
            InvestmentState(investmentModelObj: InvestmentModel()))
          ..add(InvestmentInitialEvent()),
        child: InvestmentScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvestmentBloc, InvestmentState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.v),
                  child: Column(children: [
                    Text("msg_dacharf_agro_investment".tr,
                        style: CustomTextStyles.titleLargeRobotoPrimary),
                    SizedBox(height: 18.v),
                    _buildPriceColumn(context),
                    SizedBox(height: 20.v),
                    _buildNinetyNineRow(context),
                    SizedBox(height: 17.v),
                    _buildViewRow(context),
                    SizedBox(height: 5.v)
                  ])),
              bottomNavigationBar: _buildViewRow1(context)));
    });
  }

  /// Section Widget
  Widget _buildPriceColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("msg_special_available".tr,
                    style: CustomTextStyles.bodySmallLacquerBlack90002),
                SizedBox(height: 5.v),
                SizedBox(
                    height: 116.v,
                    width: 151.h,
                    child: Stack(alignment: Alignment.topCenter, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle24,
                          height: 113.v,
                          width: 109.h,
                          radius: BorderRadius.circular(6.h),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 1.h),
                          onTap: () {
                            invest(context);
                          }),
                      CustomImageView(
                          imagePath: ImageConstant.imgMaizePrefered,
                          height: 90.v,
                          width: 151.h,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 4.v),
                          onTap: () {
                            maize(context);
                          }),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              width: 48.h,
                              margin: EdgeInsets.only(left: 24.h),
                              child: Text("lbl_maize".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .bodyMediumLemonadaPrimary)))
                    ]))
              ]),
              Container(
                  height: 128.v,
                  width: 112.h,
                  margin: EdgeInsets.only(bottom: 7.v),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                            onTap: () {
                              invest1(context);
                            },
                            child: Container(
                                height: 95.v,
                                width: 112.h,
                                margin: EdgeInsets.only(bottom: 3.v),
                                decoration: BoxDecoration(
                                    color: appTheme.gray30001,
                                    borderRadius:
                                        BorderRadius.circular(6.h))))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            width: 97.h,
                            child: Text("lbl_groundnut".tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyMediumLemonadaPrimary))),
                    CustomImageView(
                        imagePath: ImageConstant.img1Fllnqsdchmg93,
                        height: 106.v,
                        width: 103.h,
                        alignment: Alignment.topCenter,
                        onTap: () {
                          invest2(context);
                        })
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildNinetyNineRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h, right: 3.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 122.v,
                  width: 126.h,
                  margin: EdgeInsets.only(bottom: 6.v),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle26,
                        height: 97.v,
                        width: 126.h,
                        radius: BorderRadius.circular(6.h),
                        alignment: Alignment.bottomCenter,
                        onTap: () {
                          cassava1(context);
                        }),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            width: 66.h,
                            margin: EdgeInsets.only(left: 25.h),
                            child: Text("lbl_cassava".tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyMediumLemonadaPrimary))),
                    CustomImageView(
                        imagePath: ImageConstant.imgCassavaFarmland,
                        height: 96.v,
                        width: 124.h,
                        alignment: Alignment.topCenter,
                        onTap: () {
                          cassava(context);
                        })
                  ])),
              SizedBox(
                  height: 127.v,
                  width: 110.h,
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle27,
                        height: 98.v,
                        width: 110.h,
                        radius: BorderRadius.circular(6.h),
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 4.v),
                        onTap: () {
                          yam1(context);
                        }),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            width: 36.h,
                            margin: EdgeInsets.only(left: 29.h, top: 4.v),
                            child: Text("lbl_yam".tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyMediumLemonadaPrimary))),
                    CustomImageView(
                        imagePath: ImageConstant.imgYam1,
                        height: 103.v,
                        width: 109.h,
                        alignment: Alignment.topCenter,
                        onTap: () {
                          yam(context);
                        })
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildViewRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: 132.v,
          width: 130.h,
          child: Stack(alignment: Alignment.bottomLeft, children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                    onTap: () {
                      cashew(context);
                    },
                    child: Container(
                        height: 119.v,
                        width: 130.h,
                        margin: EdgeInsets.only(bottom: 1.v),
                        decoration: BoxDecoration(
                            color: appTheme.gray30001,
                            borderRadius: BorderRadius.circular(6.h))))),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    width: 98.h,
                    margin: EdgeInsets.only(left: 13.h),
                    child: Text("lbl_cashew_nut".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyMediumLemonadaPrimary))),
            CustomImageView(
                imagePath: ImageConstant.imgCashewTree11,
                height: 108.v,
                width: 130.h,
                alignment: Alignment.topCenter,
                onTap: () {
                  cashew1(context);
                })
          ])),
      Container(
          height: 126.v,
          width: 118.h,
          margin: EdgeInsets.only(top: 6.v),
          child: Stack(alignment: Alignment.bottomRight, children: [
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      oil1(context);
                    },
                    child: Container(
                        height: 117.v,
                        width: 118.h,
                        decoration: BoxDecoration(
                            color: appTheme.gray30001,
                            borderRadius: BorderRadius.circular(6.h))))),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    width: 69.h,
                    margin: EdgeInsets.only(right: 21.h),
                    child: Text("lbl_palm_oil".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyMediumLemonadaPrimary))),
            CustomImageView(
                imagePath: ImageConstant.imgRedPalmOilCo,
                height: 101.v,
                width: 118.h,
                alignment: Alignment.topCenter,
                onTap: () {
                  oil(context);
                })
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildViewRow1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 13.h, right: 8.h, bottom: 39.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              height: 114.v,
              width: 123.h,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 107.v,
                        width: 123.h,
                        decoration: BoxDecoration(
                            color: appTheme.gray30001,
                            borderRadius: BorderRadius.circular(6.h)))),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 121.h,
                        child: Text("lbl_melon_egwusi".tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                CustomTextStyles.bodyMediumLemonadaPrimary))),
                CustomImageView(
                    imagePath: ImageConstant.imgEgusi21,
                    height: 89.v,
                    width: 122.h,
                    alignment: Alignment.topCenter,
                    onTap: () {
                      melon(context);
                    })
              ])),
          SizedBox(
              height: 114.v,
              width: 118.h,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          onion1(context);
                        },
                        child: Container(
                            height: 107.v,
                            width: 118.h,
                            decoration: BoxDecoration(
                                color: appTheme.gray30001,
                                borderRadius: BorderRadius.circular(6.h))))),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 60.h,
                        child: Text("lbl_onions".tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                CustomTextStyles.bodyMediumLemonadaPrimary))),
                CustomImageView(
                    imagePath: ImageConstant.imgOnions21,
                    height: 90.v,
                    width: 117.h,
                    alignment: Alignment.topCenter,
                    onTap: () {
                      onion(context);
                    })
              ]))
        ]));
  }

  /// Navigates to the paymentScreen when the action is triggered.
  invest(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  maize(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  invest1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  invest2(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  cassava1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  cassava(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  yam1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  yam(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  cashew(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  cashew1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  oil1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  oil(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  melon(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  onion1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  onion(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }
}
