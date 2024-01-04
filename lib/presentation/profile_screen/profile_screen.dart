import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/app_bar/appbar_title_image.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 11.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 12.h, right: 49.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 12.v),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  profile(context);
                                                },
                                                child: Text(
                                                    "lbl_adewale_collins".tr,
                                                    style: CustomTextStyles
                                                        .headlineSmallLatoExtraBold)),
                                            GestureDetector(
                                                onTap: () {
                                                  email(context);
                                                },
                                                child: Text(
                                                    "msg_adewalecollins21_gmail_com"
                                                        .tr,
                                                    style: theme
                                                        .textTheme.bodyMedium))
                                          ])),
                                  SizedBox(
                                      height: 54.v,
                                      width: 58.h,
                                      child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    height: 54.v,
                                                    width: 58.h,
                                                    decoration: BoxDecoration(
                                                        color: appTheme.gray300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    29.h)))),
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgOpenmojiPerson,
                                                height: 49.v,
                                                width: 50.h,
                                                alignment: Alignment.topCenter,
                                                onTap: () {
                                                  requestCameraGalleryPermission(
                                                      context);
                                                })
                                          ]))
                                ])),
                        SizedBox(height: 34.v),
                        Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: Text("msg_personal_details".tr,
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 6.v),
                        _buildProfile(context),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 81.v,
        centerTitle: true,
        title: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(width: double.maxFinite, child: Divider())),
          SizedBox(height: 51.v),
          AppbarTitleImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 12.h, right: 339.h),
              onTap: () {
                onTapArrowLeft(context);
              })
        ]),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildProfile(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 19.v),
        decoration: AppDecoration.fillGray20002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 92.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("lbl_first_name".tr,
                            style: CustomTextStyles.bodyMediumGray500),
                        Text("lbl_colllins".tr,
                            style: theme.textTheme.bodyMedium)
                      ])),
              SizedBox(height: 59.v),
              Padding(
                  padding: EdgeInsets.only(left: 3.h, right: 84.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 2.v),
                            child: Text("lbl_last_name".tr,
                                style: CustomTextStyles.bodyMediumGray500)),
                        Padding(
                            padding: EdgeInsets.only(top: 2.v),
                            child: Text("lbl_adewale".tr,
                                style: theme.textTheme.bodyMedium))
                      ])),
              SizedBox(height: 54.v),
              Padding(
                  padding: EdgeInsets.only(left: 3.h, right: 6.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text("lbl_email_address2".tr,
                                style: CustomTextStyles.bodyMediumGray500)),
                        Text("msg_adewalecollins_gmail_com".tr,
                            style: theme.textTheme.bodyMedium)
                      ])),
              SizedBox(height: 59.v),
              Padding(
                  padding: EdgeInsets.only(left: 3.h, right: 51.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("lbl_phone_number2".tr,
                            style: CustomTextStyles.bodyMediumGray500),
                        Text("lbl_08021000000".tr,
                            style: theme.textTheme.bodyMedium)
                      ])),
              SizedBox(height: 9.v)
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the https://nodedemo.dhiwise.co/device/api/v1/user/update-profile API and triggers a [UpdateUpdateProfileEvent] event on the [ProfileBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  profile(BuildContext context) {
    context.read<ProfileBloc>().add(
          UpdateUpdateProfileEvent(),
        );
  }

  /// Calls the https://nodedemo.dhiwise.co/device/api/v1/user/update-profile API and triggers a [UpdateUpdateProfileEvent] event on the [ProfileBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  email(BuildContext context) {
    context.read<ProfileBloc>().add(
          UpdateUpdateProfileEvent(),
        );
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
}
