import 'bloc/payment_bloc.dart';
import 'models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PaymentBloc>(
        create: (context) =>
            PaymentBloc(PaymentState(paymentModelObj: PaymentModel()))
              ..add(PaymentInitialEvent()),
        child: PaymentScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle,
                        height: 136.v,
                        width: 351.h),
                    SizedBox(height: 3.v),
                    _buildPaymentColumn(context),
                    SizedBox(height: 18.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 260.h,
                            margin: EdgeInsets.only(left: 35.h, right: 63.h),
                            child: Text("msg_your_monthly_income".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodySmallLoraBlack90002
                                    .copyWith(height: 1.54)))),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(height: 11.v);
  }

  /// Section Widget
  Widget _buildPaymentColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(9.h),
        decoration: AppDecoration.fillGray50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text("lbl_top_up".tr,
                      style:
                          CustomTextStyles.bodySmallJetBrainsMonoBlack90002)),
              SizedBox(height: 7.v),
              Column(children: [
                _buildCurrencyRow(context,
                    currencyText1: "lbl_10_000".tr,
                    currencyText2: "lbl_20_000".tr,
                    currencyText3: "lbl_50_000".tr),
                SizedBox(height: 30.v),
                _buildCurrencyRow(context,
                    currencyText1: "lbl_100_000".tr,
                    currencyText2: "lbl_200_000".tr,
                    currencyText3: "lbl_500_000".tr),
                SizedBox(height: 14.v),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 32.v,
                          width: 278.h,
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant
                                    .imgTablerCurrencyNairaBlack90002,
                                height: 17.v,
                                width: 15.h,
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(top: 6.v)),
                            Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: 32.v,
                                    width: 276.h,
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                  width: 206.h,
                                                  child: Text(
                                                      "msg_10_000_1_000_000_000"
                                                          .tr,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .bodyLargeBlack90002))),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 2.v),
                                                  child: SizedBox(
                                                      width: 276.h,
                                                      child: Divider(
                                                          color: appTheme
                                                              .blueGray100))))
                                        ])))
                          ])),
                      Container(
                          height: 24.v,
                          width: 58.h,
                          margin: EdgeInsets.only(top: 2.v, bottom: 5.v),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      pay1(context);
                                    },
                                    child: Container(
                                        height: 22.v,
                                        width: 58.h,
                                        decoration: BoxDecoration(
                                            color: appTheme.greenA70035,
                                            borderRadius:
                                                BorderRadius.circular(11.h))))),
                            Align(
                                alignment: Alignment.center,
                                child: Text("lbl_invest".tr,
                                    style: CustomTextStyles
                                        .bodySmallLemonadaPrimaryContainer))
                          ]))
                    ])
              ]),
              SizedBox(height: 13.v)
            ]));
  }

  /// Common widget
  Widget _buildCurrencyRow(
    BuildContext context, {
    required String currencyText1,
    required String currencyText2,
    required String currencyText3,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 89.h,
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 12.v),
          decoration: AppDecoration.fillPrimaryContainer
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgTablerCurrencyNairaBlack90002,
                    height: 17.v,
                    width: 15.h,
                    margin: EdgeInsets.only(top: 6.v, bottom: 8.v)),
                SizedBox(
                    width: 6.h,
                    child: Text(currencyText1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: appTheme.black90002)))
              ])),
      Spacer(flex: 55),
      Container(
          width: 90.h,
          padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 12.v),
          decoration: AppDecoration.fillPrimaryContainer
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomImageView(
                imagePath: ImageConstant.imgTablerCurrencyNairaBlack90002,
                height: 17.v,
                width: 15.h,
                margin: EdgeInsets.symmetric(vertical: 7.v)),
            SizedBox(
                width: 70.h,
                child: Text(currencyText2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: appTheme.black90002)))
          ])),
      Spacer(flex: 44),
      Container(
          width: 90.h,
          padding: EdgeInsets.symmetric(vertical: 11.v),
          decoration: AppDecoration.fillPrimaryContainer
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgTablerCurrencyNairaBlack90002,
                    height: 17.v,
                    width: 15.h,
                    margin: EdgeInsets.symmetric(vertical: 8.v)),
                SizedBox(
                    width: 70.h,
                    child: Text(currencyText3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: appTheme.black90002)))
              ]))
    ]);
  }

  /// Calls the {{baseUrl}}/customer/:code/identification API and triggers a [CreateIdentificationEvent] event on the [PaymentBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  pay1(BuildContext context) {
    context.read<PaymentBloc>().add(
          CreateIdentificationEvent(
            onCreateIdentificationEventSuccess: () {
              _onPostCustomerIdentificationEventSuccess(context);
            },
            onCreateIdentificationEventError: () {
              _onPostCustomerIdentificationEventError(context);
            },
          ),
        );
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  void _onPostCustomerIdentificationEventSuccess(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onPostCustomerIdentificationEventError(BuildContext context) {
    Fluttertoast.showToast(
      msg: "try again",
    );
  }
}
