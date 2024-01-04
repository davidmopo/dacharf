// ignore_for_file: must_be_immutable

part of 'iphone_8_sixteen_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Iphone8Sixteen widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Iphone8SixteenEvent extends Equatable {}

/// Event that is dispatched when the Iphone8Sixteen widget is first created.
class Iphone8SixteenInitialEvent extends Iphone8SixteenEvent {
  @override
  List<Object?> get props => [];
}
