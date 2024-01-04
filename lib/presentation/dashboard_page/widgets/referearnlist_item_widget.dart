import '../models/referearnlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';

// ignore: must_be_immutable
class ReferearnlistItemWidget extends StatelessWidget {
  ReferearnlistItemWidget(
    this.referearnlistItemModelObj, {
    Key? key,
    this.refer,
  }) : super(
          key: key,
        );

  ReferearnlistItemModel referearnlistItemModelObj;

  VoidCallback? refer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        children: [
          CustomImageView(
            imagePath: referearnlistItemModelObj?.referImage,
            height: 48.adaptSize,
            width: 48.adaptSize,
            margin: EdgeInsets.only(
              top: 2.v,
              bottom: 3.v,
            ),
            onTap: () {
              refer!.call();
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 41.h,
              top: 10.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text(
                    referearnlistItemModelObj.referText!,
                    style: CustomTextStyles.titleMediumPoppins,
                  ),
                ),
                SizedBox(height: 2.v),
                Text(
                  referearnlistItemModelObj.cashbackText!,
                  style: CustomTextStyles.bodyMediumPoorRichard,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
