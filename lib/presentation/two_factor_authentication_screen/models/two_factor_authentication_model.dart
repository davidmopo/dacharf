// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [two_factor_authentication_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TwoFactorAuthenticationModel extends Equatable {
  TwoFactorAuthenticationModel() {}

  TwoFactorAuthenticationModel copyWith() {
    return TwoFactorAuthenticationModel();
  }

  @override
  List<Object?> get props => [];
}
