import 'bloc/history_bloc.dart';
import 'models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HistoryBloc>(
        create: (context) =>
            HistoryBloc(HistoryState(historyModelObj: HistoryModel()))
              ..add(HistoryInitialEvent()),
        child: HistoryScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle462,
                            height: 11.v,
                            width: 375.h),
                        SizedBox(height: 9.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowLeftBlack90003,
                            height: 15.adaptSize,
                            width: 15.adaptSize,
                            margin: EdgeInsets.only(left: 8.h),
                            onTap: () {
                              onTapImgArrowLeft(context);
                            }),
                        SizedBox(height: 19.v),
                        Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text("msg_transaction_history".tr,
                                style: CustomTextStyles
                                    .headlineLargeLeagueGothicBlack90002)),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
