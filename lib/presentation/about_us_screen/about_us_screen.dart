import 'bloc/about_us_bloc.dart';
import 'models/about_us_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/presentation/dashboard_page/dashboard_page.dart';
import 'package:programming_s_application4/widgets/custom_bottom_bar.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<AboutUsBloc>(
        create: (context) =>
            AboutUsBloc(AboutUsState(aboutUsModelObj: AboutUsModel()))
              ..add(AboutUsInitialEvent()),
        child: AboutUsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle464,
                            height: 11.v,
                            width: 375.h),
                        SizedBox(height: 12.v),
                        Padding(
                            padding: EdgeInsets.only(left: 5.h, right: 105.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgArrowLeftBlack90003,
                                      height: 15.adaptSize,
                                      width: 15.adaptSize,
                                      margin: EdgeInsets.only(bottom: 55.v),
                                      onTap: () {
                                        onTapImgArrowLeft(context);
                                      }),
                                  Spacer(flex: 63),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 14.v, bottom: 7.v),
                                      child: Text("lbl_about_us".tr,
                                          style:
                                              theme.textTheme.displayMedium)),
                                  Spacer(flex: 36),
                                  CustomImageView(
                                      imagePath: ImageConstant
                                          .imgDfcLogo3RemovebgPreview70x70,
                                      height: 70.adaptSize,
                                      width: 70.adaptSize)
                                ])),
                        SizedBox(height: 6.v),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 347.h,
                                margin:
                                    EdgeInsets.only(left: 12.h, right: 15.h),
                                child: Text("msg_dacharf_agro_investment2".tr,
                                    maxLines: 20,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .bodySmallRobotoBlack90002
                                        .copyWith(height: 1.50)))),
                        SizedBox(height: 75.v),
                        CustomElevatedButton(
                            height: 55.v,
                            text: "lbl_invest_here".tr,
                            margin: EdgeInsets.only(left: 46.h, right: 64.h),
                            buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                            buttonTextStyle: CustomTextStyles
                                .headlineSmallRobotoPrimaryContainer,
                            onPressed: () {
                              investment(context);
                            }),
                        SizedBox(height: 5.v)
                      ])),
              bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(left: 12.h, right: 17.h),
                  child: _buildBottomBar(context))));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.History:
        return "/";
      case BottomBarEnum.Aboutus:
        return "/";
      case BottomBarEnum.Me:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the paymentScreen when the action is triggered.
  investment(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.paymentScreen,
    );
  }
}
