// ignore_for_file: must_be_immutable

part of 'investment_bloc.dart';

/// Represents the state of Investment in the application.
class InvestmentState extends Equatable {
  InvestmentState({this.investmentModelObj});

  InvestmentModel? investmentModelObj;

  @override
  List<Object?> get props => [
        investmentModelObj,
      ];
  InvestmentState copyWith({InvestmentModel? investmentModelObj}) {
    return InvestmentState(
      investmentModelObj: investmentModelObj ?? this.investmentModelObj,
    );
  }
}
