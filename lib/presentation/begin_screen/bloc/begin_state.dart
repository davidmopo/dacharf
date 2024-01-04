// ignore_for_file: must_be_immutable

part of 'begin_bloc.dart';

/// Represents the state of Begin in the application.
class BeginState extends Equatable {
  BeginState({
    this.lastNameController,
    this.egCounterController,
    this.beginModelObj,
  });

  TextEditingController? lastNameController;

  TextEditingController? egCounterController;

  BeginModel? beginModelObj;

  @override
  List<Object?> get props => [
        lastNameController,
        egCounterController,
        beginModelObj,
      ];
  BeginState copyWith({
    TextEditingController? lastNameController,
    TextEditingController? egCounterController,
    BeginModel? beginModelObj,
  }) {
    return BeginState(
      lastNameController: lastNameController ?? this.lastNameController,
      egCounterController: egCounterController ?? this.egCounterController,
      beginModelObj: beginModelObj ?? this.beginModelObj,
    );
  }
}
