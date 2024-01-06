import 'bloc/support_bloc.dart';
import 'models/support_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SupportBloc>(
        create: (context) =>
            SupportBloc(SupportState(supportModelObj: SupportModel()))
              ..add(SupportInitialEvent()),
        child: SupportScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportBloc, SupportState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle463,
                            height: 11.v,
                            width: 375.h),
                        SizedBox(height: 8.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowLeftBlack90003,
                            height: 15.adaptSize,
                            width: 15.adaptSize,
                            margin: EdgeInsets.only(left: 8.h),
                            onTap: () {
                              onTapImgArrowLeft(context);
                            }),
                        Padding(
                            padding: EdgeInsets.only(left: 51.h),
                            child: Text("lbl_hello".tr,
                                style: theme.textTheme.displayMedium)),
                        SizedBox(height: 2.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text("msg_how_can_we_help".tr,
                                style: CustomTextStyles.headlineSmallLato)),
                        SizedBox(height: 33.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h, right: 21.h),
                            child: _buildWhatsappRow(context,
                                text: "lbl_help".tr,
                                image: ImageConstant.imgMdiLightMessage)),
                        SizedBox(height: 5.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h, right: 21.h),
                            child: _buildWhatsappRow(context,
                                text: "lbl_whatsapp".tr,
                                image: ImageConstant.imgLogosWhatsappIcon)),
                        Spacer(flex: 32),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h, right: 21.h),
                            child: _buildWhatsappRow(context,
                                text: "msg_send_us_a_direct".tr,
                                image: ImageConstant.imgIcBaselinePlayArrow)),
                        Spacer(flex: 67)
                      ]))));
    });
  }

  /// Common widget
  Widget _buildWhatsappRow(
    BuildContext context, {
    required String text,
    required String image,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 9.v),
        decoration: AppDecoration.fillGray200,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8.v, bottom: 13.v),
                  child: Text(text,
                      style: CustomTextStyles.headlineSmallLato
                          .copyWith(color: appTheme.black90002))),
              CustomImageView(
                  imagePath: image,
                  height: 45.adaptSize,
                  width: 45.adaptSize,
                  margin: EdgeInsets.only(top: 6.v, right: 21.h))
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
