import 'bloc/begin_bloc.dart';
import 'models/begin_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/core/utils/validation_functions.dart';
import 'package:programming_s_application4/widgets/app_bar/appbar_title_image.dart';
import 'package:programming_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:programming_s_application4/widgets/custom_elevated_button.dart';
import 'package:programming_s_application4/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class BeginScreen extends StatelessWidget {
  BeginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<BeginBloc>(
        create: (context) => BeginBloc(BeginState(beginModelObj: BeginModel()))
          ..add(BeginInitialEvent()),
        child: BeginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 25.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 21.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Text("lbl_begin".tr,
                                        style: CustomTextStyles
                                            .headlineSmallBold)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgOverflowMenu,
                                    height: 29.adaptSize,
                                    width: 29.adaptSize,
                                    margin: EdgeInsets.only(
                                        left: 13.h, bottom: 3.v))
                              ])),
                          SizedBox(height: 4.v),
                          Container(
                              width: 311.h,
                              margin: EdgeInsets.only(left: 15.h, right: 49.h),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_register_to_start2".tr,
                                        style:
                                            CustomTextStyles.bodyMediumLight),
                                    TextSpan(
                                        text: "lbl_dacharf_today".tr,
                                        style: CustomTextStyles
                                            .labelLargeLatoBlack90002)
                                  ]),
                                  textAlign: TextAlign.left)),
                          SizedBox(height: 58.v),
                          _buildEightySeven(context),
                          SizedBox(height: 42.v),
                          _buildEightyNine(context),
                          SizedBox(height: 243.v),
                          CustomElevatedButton(
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(left: 15.h, right: 27.h),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              onPressed: () {
                                logIn(context);
                              }),
                          SizedBox(height: 3.v),
                          Padding(
                              padding: EdgeInsets.only(left: 119.h),
                              child: Row(children: [
                                Text("msg_this_form_is_encrypted".tr,
                                    style: CustomTextStyles
                                        .bodySmallOoohBabyBlack90002),
                                Container(
                                    height: 10.v,
                                    width: 9.h,
                                    margin:
                                        EdgeInsets.only(left: 5.h, bottom: 3.v),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1.h, vertical: 2.v),
                                    decoration: AppDecoration.fillBlueGray
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgAkarIconsCheck,
                                        height: 6.v,
                                        width: 7.h,
                                        alignment: Alignment.center))
                              ])),
                          SizedBox(height: 31.v),
                          Container(
                              height: 11.v,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.primary))
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarTitleImage(imagePath: ImageConstant.imgRectangle10));
  }

  /// Section Widget
  Widget _buildEightySeven(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_first_last_name".tr, style: theme.textTheme.labelLarge),
          SizedBox(height: 4.v),
          Padding(
              padding: EdgeInsets.only(right: 12.h),
              child:
                  BlocSelector<BeginBloc, BeginState, TextEditingController?>(
                      selector: (state) => state.lastNameController,
                      builder: (context, lastNameController) {
                        return CustomTextFormField(
                            controller: lastNameController,
                            validator: (value) {
                              if (value == null ||
                                  (!isText(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_text".tr;
                              }
                              return null;
                            });
                      }))
        ]));
  }

  /// Section Widget
  Widget _buildEightyNine(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_enter_a_referral".tr, style: theme.textTheme.labelLarge),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(right: 12.h),
              child:
                  BlocSelector<BeginBloc, BeginState, TextEditingController?>(
                      selector: (state) => state.egCounterController,
                      builder: (context, egCounterController) {
                        return CustomTextFormField(
                            controller: egCounterController,
                            hintText: "lbl_e_g_8102345678".tr,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (!isNumeric(value)) {
                                return "err_msg_please_enter_valid_number".tr;
                              }
                              return null;
                            });
                      }))
        ]));
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  logIn(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }
}
