import 'bloc/pin_creation_bloc.dart';
import 'models/pin_creation_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';
import 'package:programming_s_application4/widgets/custom_pin_code_text_field.dart';

class PinCreationScreen extends StatelessWidget {
  const PinCreationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<PinCreationBloc>(
      create: (context) => PinCreationBloc(PinCreationState(
        pinCreationModelObj: PinCreationModel(),
      ))
        ..add(PinCreationInitialEvent()),
      child: PinCreationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle20,
                height: 6.v,
                width: 375.h,
              ),
              SizedBox(height: 46.v),
              Padding(
                padding: EdgeInsets.only(left: 13.h),
                child: Text(
                  "msg_create_your_6_digit".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "msg_create_a_pin_for".tr,
                  style: CustomTextStyles.bodySmallKottaOneBlack90002,
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  right: 179.h,
                ),
                child: BlocSelector<PinCreationBloc, PinCreationState,
                    TextEditingController?>(
                  selector: (state) => state.otpController,
                  builder: (context, otpController) {
                    return CustomPinCodeTextField(
                      context: context,
                      controller: otpController,
                      onChanged: (value) {
                        otpController?.text = value;
                      },
                    );
                  },
                ),
              ),
              Spacer(),
              SizedBox(height: 48.v),
              _buildPinCreation(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPinCreation(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 2.h,
              right: 1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "lbl_1".tr,
                  style: theme.textTheme.headlineSmall,
                ),
                Spacer(
                  flex: 46,
                ),
                Text(
                  "lbl_2".tr,
                  style: theme.textTheme.headlineSmall,
                ),
                Spacer(
                  flex: 53,
                ),
                Text(
                  "lbl_3".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 45.v),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "lbl_4".tr,
                  style: theme.textTheme.headlineSmall,
                ),
                Spacer(
                  flex: 46,
                ),
                Text(
                  "lbl_5".tr,
                  style: theme.textTheme.headlineSmall,
                ),
                Spacer(
                  flex: 53,
                ),
                Text(
                  "lbl_6".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 45.v),
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              right: 5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "lbl_7".tr,
                  style: theme.textTheme.headlineSmall,
                ),
                Spacer(
                  flex: 46,
                ),
                Text(
                  "lbl_8".tr,
                  style: theme.textTheme.headlineSmall,
                ),
                Spacer(
                  flex: 53,
                ),
                Text(
                  "lbl_9".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 133.h,
                right: 7.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "lbl_0".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                  Text(
                    "lbl2".tr,
                    style: CustomTextStyles.headlineSmallOnPrimaryContainer,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
