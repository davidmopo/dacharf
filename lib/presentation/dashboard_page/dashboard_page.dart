import '../dashboard_page/widgets/referearnlist_item_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/dashboard_model.dart';
import 'models/referearnlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/app_bar/appbar_title_image.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:programming_s_application4/widgets/custom_icon_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardBloc>(
        create: (context) =>
            DashboardBloc(DashboardState(dashboardModelObj: DashboardModel()))
              ..add(DashboardInitialEvent()),
        child: DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 2.v),
                child: Column(children: [
                  _buildPersonRow(context),
                  SizedBox(height: 5.v),
                  _buildDashboardColumn(context),
                  SizedBox(height: 71.v),
                  _buildReferEarnList(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 15.v,
        centerTitle: true,
        title: AppbarTitleImage(imagePath: ImageConstant.imgRectangle1));
  }

  /// Section Widget
  Widget _buildPersonRow(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Row(children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOpenmojiPerson,
                  height: 49.v,
                  width: 50.h,
                  onTap: () {
                    requestCameraGalleryPermission(context);
                  }),
              GestureDetector(
                  onTap: () {
                    update(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 14.v, bottom: 8.v),
                      child:
                          BlocSelector<DashboardBloc, DashboardState, String?>(
                              selector: (state) => state.dashboardModelObj!.hi,
                              builder: (context, hi) {
                                return Text(hi ?? "",
                                    style: CustomTextStyles
                                        .titleLargeKreonBlack90002);
                              }))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgFluentPersonS,
                  height: 24.v,
                  width: 23.h,
                  margin: EdgeInsets.only(top: 13.v, bottom: 12.v),
                  onTap: () {
                    support(context);
                  }),
              CustomImageView(
                  imagePath: ImageConstant.imgTelevision,
                  height: 14.v,
                  width: 19.h,
                  margin: EdgeInsets.only(left: 27.h, top: 18.v, bottom: 17.v),
                  onTap: () {
                    requestLocationPermission(context);
                  }),
              CustomImageView(
                  imagePath: ImageConstant.imgMingcuteNotificationLine,
                  height: 23.v,
                  width: 26.h,
                  margin: EdgeInsets.only(left: 18.h, top: 13.v, bottom: 13.v),
                  onTap: () {
                    notify(context);
                  })
            ])));
  }

  /// Section Widget
  Widget _buildDashboardColumn(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 11.h),
        padding: EdgeInsets.all(6.h),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Padding(
                  padding: EdgeInsets.only(left: 7.h, right: 13.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 2.v),
                            child: Text("msg_available_balance".tr,
                                style: CustomTextStyles
                                    .labelLargePrimaryContainer)),
                        CustomImageView(
                            imagePath: ImageConstant.imgMdiEye,
                            height: 14.v,
                            width: 15.h,
                            margin: EdgeInsets.only(left: 4.h, bottom: 3.v)),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              history(context);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(top: 2.v),
                                child: Text("msg_transaction_history".tr,
                                    style: CustomTextStyles
                                        .labelLargePrimaryContainer))),
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowRight,
                            height: 10.adaptSize,
                            width: 10.adaptSize,
                            margin: EdgeInsets.only(
                                left: 1.h, top: 4.v, bottom: 4.v),
                            onTap: () {
                              history1(context);
                            })
                      ])),
              SizedBox(height: 3.v),
              Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: 28.v,
                      width: 56.h,
                      child: Stack(alignment: Alignment.centerRight, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgTablerCurrencyNaira,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            alignment: Alignment.bottomLeft),
                        Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_0".tr,
                                      style:
                                          CustomTextStyles.headlineLargeKreon),
                                  TextSpan(
                                      text: "lbl".tr,
                                      style: CustomTextStyles
                                          .labelLargePrimaryContainer_1),
                                  TextSpan(
                                      text: "lbl_00".tr,
                                      style: CustomTextStyles
                                          .titleSmallKreonPrimaryContainer)
                                ]),
                                textAlign: TextAlign.left))
                      ]))),
              SizedBox(height: 13.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          CustomIconButton(
                              height: 35.v,
                              width: 40.h,
                              padding: EdgeInsets.all(5.h),
                              decoration: IconButtonStyleHelper.outlineBlack,
                              onTap: () {
                                pay(context);
                              },
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgLucideCross)),
                          SizedBox(height: 9.v),
                          Text("lbl_add_money".tr,
                              style: CustomTextStyles
                                  .labelLargePoppinsPrimaryContainer)
                        ]),
                        Spacer(flex: 47),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: 35.v,
                                      width: 40.h,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.h, vertical: 5.v),
                                      decoration: AppDecoration.outlineBlack
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder4),
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgStreamlineBagDollar,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          alignment: Alignment.topCenter,
                                          onTap: () {
                                            invest(context);
                                          }))),
                              SizedBox(height: 7.v),
                              Text("lbl_invest".tr,
                                  style: CustomTextStyles
                                      .labelLargePoppinsPrimaryContainer)
                            ]),
                        Spacer(flex: 52),
                        Column(children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  height: 35.v,
                                  width: 40.h,
                                  margin: EdgeInsets.only(right: 8.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 4.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder4),
                                  child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgTelevisionPrimary,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      alignment: Alignment.topCenter,
                                      onTap: () {
                                        withdraw(context);
                                      }))),
                          SizedBox(height: 7.v),
                          Text("lbl_withdraw".tr,
                              style: CustomTextStyles
                                  .labelLargePoppinsPrimaryContainer)
                        ])
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildReferEarnList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.h),
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 32.v);
                  },
                  itemCount:
                      dashboardModelObj?.referearnlistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ReferearnlistItemModel model =
                        dashboardModelObj?.referearnlistItemList[index] ??
                            ReferearnlistItemModel();
                    return ReferearnlistItemWidget(model, refer: () {
                      refer(context);
                    });
                  });
            }));
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  requestCameraGalleryPermission(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }

  /// Calls the https://nodedemo.dhiwise.co/device/api/v1/user/update-profile API and triggers a [UpdateUpdateProfileEvent] event on the [DashboardBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  update(BuildContext context) {
    context.read<DashboardBloc>().add(UpdateUpdateProfileEvent());
  }

  /// Navigates to the supportScreen when the action is triggered.
  support(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.supportScreen);
  }

  /// Asks the user for permission to access their device's location using the
  /// [PermissionManager] plugin.
  ///
  /// Throws an error if the permission is permanently denied or the user has
  /// selected "don't ask again".
  requestLocationPermission(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.location);
  }

  /// Navigates to the notificationScreen when the action is triggered.
  notify(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.notificationScreen);
  }

  /// Navigates to the historyScreen when the action is triggered.
  history(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.historyScreen);
  }

  /// Navigates to the historyScreen when the action is triggered.
  history1(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.historyScreen);
  }

  /// Calls the {{baseUrl}}/customer API and triggers a [CreateCustomerEvent] event on the [DashboardBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  pay(BuildContext context) {
    context
        .read<DashboardBloc>()
        .add(CreateCustomerEvent(onCreateCustomerEventSuccess: () {
          _onCreateCustomerEventSuccess(context);
        }, onCreateCustomerEventError: () {
          _onCreateCustomerEventError(context);
        }));
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  void _onCreateCustomerEventSuccess(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
        AppRoutes.dashboardContainerScreen);
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateCustomerEventError(BuildContext context) {
    Fluttertoast.showToast(msg: "error");
  }

  /// Navigates to the paymentScreen when the action is triggered.
  invest(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.paymentScreen);
  }

  /// Calls the {{baseUrl}}/transferrecipient API and triggers a [CreateTransferrecipientEvent] event on the [DashboardBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  withdraw(BuildContext context) {
    context.read<DashboardBloc>().add(CreateTransferrecipientEvent(
            onCreateTransferrecipientEventSuccess: () {
          _onCreateTransferRecipientEventSuccess(context);
        }, onCreateTransferrecipientEventError: () {
          _onCreateTransferRecipientEventError(context);
        }));
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateTransferRecipientEventSuccess(BuildContext context) {
    Fluttertoast.showToast(msg: "Successful");
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateTransferRecipientEventError(BuildContext context) {
    Fluttertoast.showToast(msg: "error");
  }

  /// Navigates to the referralEarningScreen when the action is triggered.
  refer(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.referralEarningScreen,
    );
  }
}
