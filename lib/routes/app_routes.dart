import 'package:flutter/material.dart';
import 'package:programming_s_application4/presentation/begin_screen/begin_screen.dart';
import 'package:programming_s_application4/presentation/get_started_screen/get_started_screen.dart';
import 'package:programming_s_application4/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:programming_s_application4/presentation/account_creation_screen/account_creation_screen.dart';
import 'package:programming_s_application4/presentation/pin_creation_screen/pin_creation_screen.dart';
import 'package:programming_s_application4/presentation/investment_screen/investment_screen.dart';
import 'package:programming_s_application4/presentation/payment_screen/payment_screen.dart';
import 'package:programming_s_application4/presentation/more_screen/more_screen.dart';
import 'package:programming_s_application4/presentation/profile_screen/profile_screen.dart';
import 'package:programming_s_application4/presentation/password_change_screen/password_change_screen.dart';
import 'package:programming_s_application4/presentation/reward_screen/reward_screen.dart';
import 'package:programming_s_application4/presentation/splash_screen/splash_screen.dart';
import 'package:programming_s_application4/presentation/referral_earning_screen/referral_earning_screen.dart';
import 'package:programming_s_application4/presentation/notification_screen/notification_screen.dart';
import 'package:programming_s_application4/presentation/two_factor_authentication_screen/two_factor_authentication_screen.dart';
import 'package:programming_s_application4/presentation/two_factor_authentication_verify_screen/two_factor_authentication_verify_screen.dart';
import 'package:programming_s_application4/presentation/history_screen/history_screen.dart';
import 'package:programming_s_application4/presentation/support_screen/support_screen.dart';
import 'package:programming_s_application4/presentation/about_us_screen/about_us_screen.dart';
import 'package:programming_s_application4/presentation/iphone_8_sixteen_screen/iphone_8_sixteen_screen.dart';
import 'package:programming_s_application4/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String beginScreen = '/begin_screen';

  static const String getStartedScreen = '/get_started_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String dashboardContainerScreen = '/dashboard_container_screen';

  static const String accountCreationScreen = '/account_creation_screen';

  static const String pinCreationScreen = '/pin_creation_screen';

  static const String investmentScreen = '/investment_screen';

  static const String paymentScreen = '/payment_screen';

  static const String moreScreen = '/more_screen';

  static const String profileScreen = '/profile_screen';

  static const String passwordChangeScreen = '/password_change_screen';

  static const String rewardScreen = '/reward_screen';

  static const String splashScreen = '/splash_screen';

  static const String referralEarningScreen = '/referral_earning_screen';

  static const String notificationScreen = '/notification_screen';

  static const String twoFactorAuthenticationScreen =
      '/two_factor_authentication_screen';

  static const String twoFactorAuthenticationVerifyScreen =
      '/two_factor_authentication_verify_screen';

  static const String historyScreen = '/history_screen';

  static const String supportScreen = '/support_screen';

  static const String aboutUsScreen = '/about_us_screen';

  static const String iphone8SixteenScreen = '/iphone_8_sixteen_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        beginScreen: BeginScreen.builder,
        getStartedScreen: GetStartedScreen.builder,
        dashboardContainerScreen: DashboardContainerScreen.builder,
        accountCreationScreen: AccountCreationScreen.builder,
        pinCreationScreen: PinCreationScreen.builder,
        investmentScreen: InvestmentScreen.builder,
        paymentScreen: PaymentScreen.builder,
        moreScreen: MoreScreen.builder,
        profileScreen: ProfileScreen.builder,
        passwordChangeScreen: PasswordChangeScreen.builder,
        rewardScreen: RewardScreen.builder,
        splashScreen: SplashScreen.builder,
        referralEarningScreen: ReferralEarningScreen.builder,
        notificationScreen: NotificationScreen.builder,
        twoFactorAuthenticationScreen: TwoFactorAuthenticationScreen.builder,
        twoFactorAuthenticationVerifyScreen:
            TwoFactorAuthenticationVerifyScreen.builder,
        historyScreen: HistoryScreen.builder,
        supportScreen: SupportScreen.builder,
        aboutUsScreen: AboutUsScreen.builder,
        iphone8SixteenScreen: Iphone8SixteenScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
