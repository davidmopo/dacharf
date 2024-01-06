// ignore_for_file: must_be_immutable

part of 'support_bloc.dart';

/// Represents the state of Support in the application.
class SupportState extends Equatable {
  SupportState({this.supportModelObj});

  SupportModel? supportModelObj;

  @override
  List<Object?> get props => [
        supportModelObj,
      ];
  SupportState copyWith({SupportModel? supportModelObj}) {
    return SupportState(
      supportModelObj: supportModelObj ?? this.supportModelObj,
    );
  }
}
