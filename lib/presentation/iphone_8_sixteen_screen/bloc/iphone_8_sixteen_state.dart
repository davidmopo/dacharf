// ignore_for_file: must_be_immutable

part of 'iphone_8_sixteen_bloc.dart';

/// Represents the state of Iphone8Sixteen in the application.
class Iphone8SixteenState extends Equatable {
  Iphone8SixteenState({this.iphone8SixteenModelObj});

  Iphone8SixteenModel? iphone8SixteenModelObj;

  @override
  List<Object?> get props => [
        iphone8SixteenModelObj,
      ];
  Iphone8SixteenState copyWith({Iphone8SixteenModel? iphone8SixteenModelObj}) {
    return Iphone8SixteenState(
      iphone8SixteenModelObj:
          iphone8SixteenModelObj ?? this.iphone8SixteenModelObj,
    );
  }
}
