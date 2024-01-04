// ignore_for_file: must_be_immutable

part of 'about_us_bloc.dart';

/// Represents the state of AboutUs in the application.
class AboutUsState extends Equatable {
  AboutUsState({this.aboutUsModelObj});

  AboutUsModel? aboutUsModelObj;

  @override
  List<Object?> get props => [
        aboutUsModelObj,
      ];
  AboutUsState copyWith({AboutUsModel? aboutUsModelObj}) {
    return AboutUsState(
      aboutUsModelObj: aboutUsModelObj ?? this.aboutUsModelObj,
    );
  }
}
