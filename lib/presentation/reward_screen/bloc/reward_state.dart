// ignore_for_file: must_be_immutable

part of 'reward_bloc.dart';

/// Represents the state of Reward in the application.
class RewardState extends Equatable {
  RewardState({this.rewardModelObj});

  RewardModel? rewardModelObj;

  @override
  List<Object?> get props => [
        rewardModelObj,
      ];
  RewardState copyWith({RewardModel? rewardModelObj}) {
    return RewardState(
      rewardModelObj: rewardModelObj ?? this.rewardModelObj,
    );
  }
}
