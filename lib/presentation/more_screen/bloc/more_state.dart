// ignore_for_file: must_be_immutable

part of 'more_bloc.dart';

/// Represents the state of More in the application.
class MoreState extends Equatable {
  MoreState({this.moreModelObj});

  MoreModel? moreModelObj;

  @override
  List<Object?> get props => [
        moreModelObj,
      ];
  MoreState copyWith({MoreModel? moreModelObj}) {
    return MoreState(
      moreModelObj: moreModelObj ?? this.moreModelObj,
    );
  }
}
