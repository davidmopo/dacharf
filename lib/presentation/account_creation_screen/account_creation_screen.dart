import 'bloc/account_creation_bloc.dart';
import 'models/account_creation_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:programming_s_application4/widgets/custom_icon_button.dart';
import 'package:programming_s_application4/domain/googleauth/google_auth_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:programming_s_application4/domain/facebookauth/facebook_auth_helper.dart';
import 'package:programming_s_application4/domain/facebookauth/facebook_user.dart';

class AccountCreationScreen extends StatelessWidget {
  const AccountCreationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountCreationBloc>(
        create: (context) => AccountCreationBloc(AccountCreationState(
            accountCreationModelObj: AccountCreationModel()))
          ..add(AccountCreationInitialEvent()),
        child: AccountCreationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCreationBloc, AccountCreationState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.orange800,
              body: Container(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(height: 2.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle2,
                        height: 300.v,
                        width: 1500.h,
                        radius: BorderRadius.circular(15.h)),
                    SizedBox(height: 18.v),
                    _buildAccountCreation(context),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildAccountCreation(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: 296.h,
              margin: EdgeInsets.only(left: 12.h, right: 25.h),
              child: Text("msg_invest_with_ease".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineMedium)),
          SizedBox(height: 29.v),
          CustomElevatedButton(
              text: "lbl_create_account".tr,
              margin: EdgeInsets.only(right: 9.h),
              buttonStyle: CustomButtonStyles.fillWhiteA,
              buttonTextStyle: CustomTextStyles.titleLargeKottaOneBlack90002,
              onPressed: () {
                signUp(context);
              }),
          SizedBox(height: 23.v),
          CustomElevatedButton(
              text: "lbl_login".tr,
              margin: EdgeInsets.only(right: 9.h),
              buttonStyle: CustomButtonStyles.fillBlack,
              buttonTextStyle:
                  CustomTextStyles.headlineSmallKottaOnePrimaryContainer,
              onPressed: () {
                signInWithGoogle(context);
              }),
          SizedBox(height: 23.v),
          Padding(
              padding: EdgeInsets.only(left: 86.h),
              child: Row(children: [
                CustomIconButton(
                    height: 31.v,
                    width: 43.h,
                    decoration: IconButtonStyleHelper.fillPrimaryContainer,
                    onTap: () {
                      signInWithFacebook(context);
                    },
                    child: CustomImageView(
                        imagePath: ImageConstant.imgIcBaselineFacebook)),
                Padding(
                    padding: EdgeInsets.only(left: 53.h),
                    child: CustomIconButton(
                        height: 31.v,
                        width: 40.h,
                        onTap: () {
                          signIn(context);
                        },
                        child: CustomImageView(
                            imagePath: ImageConstant.imgImage821)))
              ]))
        ]));
  }

  /// Navigates to the beginScreen when the action is triggered.
  signUp(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.beginScreen,
    );
  }

  signInWithGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        onSuccessGoogleAuthResponse(googleUser, context);
      } else {
        onErrorGoogleAuthResponse(context);
      }
    }).catchError((onError) {
      onErrorGoogleAuthResponse(context);
    });
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  onSuccessGoogleAuthResponse(
    GoogleSignInAccount googleUser,
    BuildContext context,
  ) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  onErrorGoogleAuthResponse(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Error",
    );
    Fluttertoast.showToast(
      msg: "Error",
    );
  }

  signInWithFacebook(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      onSuccessFacebookAuthResponse(facebookUser, context);
    }).catchError((onError) {
      onErrorFacebookAuthResponse(context);
    });
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  onSuccessFacebookAuthResponse(
    FacebookUser facebookUser,
    BuildContext context,
  ) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  onErrorFacebookAuthResponse(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Error",
    );
  }

  signIn(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        onSuccessGoogleAuthResponse(googleUser, context);
      } else {
        onErrorGoogleAuthResponse(context);
      }
    }).catchError((onError) {
      onErrorGoogleAuthResponse(context);
    });
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  onSuccessGoogleAuthResponse(
    GoogleSignInAccount googleUser,
    BuildContext context,
  ) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }
}
