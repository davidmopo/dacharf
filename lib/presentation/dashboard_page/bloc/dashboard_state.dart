// ignore_for_file: must_be_immutable

part of 'dashboard_bloc.dart';

/// Represents the state of Dashboard in the application.
class DashboardState extends Equatable {
  DashboardState({this.dashboardModelObj});

  DashboardModel? dashboardModelObj;

  @override
  List<Object?> get props => [
        dashboardModelObj,
      ];
  DashboardState copyWith({DashboardModel? dashboardModelObj}) {
    return DashboardState(
      dashboardModelObj: dashboardModelObj ?? this.dashboardModelObj,
    );
  }
}
