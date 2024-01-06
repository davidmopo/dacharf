// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'referearnlist_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({
    this.hi = "",
    this.referearnlistItemList = const [],
  }) {}

  String hi;

  List<ReferearnlistItemModel> referearnlistItemList;

  DashboardModel copyWith({
    String? hi,
    List<ReferearnlistItemModel>? referearnlistItemList,
  }) {
    return DashboardModel(
      hi: hi ?? this.hi,
      referearnlistItemList:
          referearnlistItemList ?? this.referearnlistItemList,
    );
  }

  @override
  List<Object?> get props => [hi, referearnlistItemList];
}
