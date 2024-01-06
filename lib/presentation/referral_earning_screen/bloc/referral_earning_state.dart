// ignore_for_file: must_be_immutable

part of 'referral_earning_bloc.dart';

/// Represents the state of ReferralEarning in the application.
class ReferralEarningState extends Equatable {
  ReferralEarningState({this.referralEarningModelObj});

  ReferralEarningModel? referralEarningModelObj;

  @override
  List<Object?> get props => [
        referralEarningModelObj,
      ];
  ReferralEarningState copyWith(
      {ReferralEarningModel? referralEarningModelObj}) {
    return ReferralEarningState(
      referralEarningModelObj:
          referralEarningModelObj ?? this.referralEarningModelObj,
    );
  }
}
