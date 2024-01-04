// ignore_for_file: must_be_immutable

part of 'pin_creation_bloc.dart';

/// Represents the state of PinCreation in the application.
class PinCreationState extends Equatable {
  PinCreationState({
    this.otpController,
    this.pinCreationModelObj,
  });

  TextEditingController? otpController;

  PinCreationModel? pinCreationModelObj;

  @override
  List<Object?> get props => [
        otpController,
        pinCreationModelObj,
      ];
  PinCreationState copyWith({
    TextEditingController? otpController,
    PinCreationModel? pinCreationModelObj,
  }) {
    return PinCreationState(
      otpController: otpController ?? this.otpController,
      pinCreationModelObj: pinCreationModelObj ?? this.pinCreationModelObj,
    );
  }
}
