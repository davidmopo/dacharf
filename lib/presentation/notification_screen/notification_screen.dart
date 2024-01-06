import 'bloc/notification_bloc.dart';
import 'models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc(
            NotificationState(notificationModelObj: NotificationModel()))
          ..add(NotificationInitialEvent()),
        child: NotificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle4611x375,
                            height: 11.v,
                            width: 375.h),
                        SizedBox(height: 26.v),
                        Padding(
                            padding: EdgeInsets.only(left: 19.h),
                            child: Row(children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgArrowLeftBlack90003,
                                  height: 15.adaptSize,
                                  width: 15.adaptSize,
                                  margin: EdgeInsets.only(bottom: 1.v),
                                  onTap: () {
                                    onTapImgArrowLeft(context);
                                  }),
                              Padding(
                                  padding: EdgeInsets.only(left: 15.h),
                                  child: Text("lbl_notice".tr,
                                      style: theme.textTheme.bodyMedium))
                            ])),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
