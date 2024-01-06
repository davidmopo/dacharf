// ignore_for_file: must_be_immutable

part of 'about_us_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AboutUs widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AboutUsEvent extends Equatable {}

/// Event that is dispatched when the AboutUs widget is first created.
class AboutUsInitialEvent extends AboutUsEvent {
  @override
  List<Object?> get props => [];
}
