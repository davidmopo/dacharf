// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [more_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MoreModel extends Equatable {
  MoreModel({this.clarityLogoutLine = "..."}) {}

  String clarityLogoutLine;

  MoreModel copyWith({String? clarityLogoutLine}) {
    return MoreModel(
      clarityLogoutLine: clarityLogoutLine ?? this.clarityLogoutLine,
    );
  }

  @override
  List<Object?> get props => [clarityLogoutLine];
}
