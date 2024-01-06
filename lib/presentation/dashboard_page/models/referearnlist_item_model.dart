import '../../../core/app_export.dart';

/// This class is used in the [referearnlist_item_widget] screen.
class ReferearnlistItemModel {
  ReferearnlistItemModel({
    this.referImage,
    this.referText,
    this.cashbackText,
    this.id,
  }) {
    referImage = referImage ?? ImageConstant.imgHealthiconsReferral;
    referText = referText ?? "Refer & Earn";
    cashbackText = cashbackText ?? "Earn 5% Cashback per referral";
    id = id ?? "";
  }

  String? referImage;

  String? referText;

  String? cashbackText;

  String? id;
}
