import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Begin".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.beginScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Get Started".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.getStartedScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Dashboard - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.dashboardContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Account Creation".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.accountCreationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Pin Creation".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.pinCreationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Investment".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.investmentScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Payment".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.paymentScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "More".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.moreScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Profile".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.profileScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Password Change".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.passwordChangeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Reward".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.rewardScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Splash".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Referral Earning".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.referralEarningScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Notification".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.notificationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Two Factor Authentication".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.twoFactorAuthenticationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle:
                                  "Two Factor Authentication Verify".tr,
                              onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                                  .twoFactorAuthenticationVerifyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "History".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.historyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Support".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.supportScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "About Us".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.aboutUsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "iPhone 8 - Sixteen".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.iphone8SixteenScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
