// ignore_for_file: must_be_immutable

part of 'account_creation_bloc.dart';

/// Represents the state of AccountCreation in the application.
class AccountCreationState extends Equatable {
  AccountCreationState({this.accountCreationModelObj});

  AccountCreationModel? accountCreationModelObj;

  @override
  List<Object?> get props => [
        accountCreationModelObj,
      ];
  AccountCreationState copyWith(
      {AccountCreationModel? accountCreationModelObj}) {
    return AccountCreationState(
      accountCreationModelObj:
          accountCreationModelObj ?? this.accountCreationModelObj,
    );
  }
}
