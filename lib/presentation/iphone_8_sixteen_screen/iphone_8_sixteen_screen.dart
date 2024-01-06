import 'bloc/iphone_8_sixteen_bloc.dart';
import 'models/iphone_8_sixteen_model.dart';
import 'package:flutter/material.dart';
import 'package:programming_s_application4/core/app_export.dart';

class Iphone8SixteenScreen extends StatelessWidget {
  const Iphone8SixteenScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone8SixteenBloc>(
      create: (context) => Iphone8SixteenBloc(Iphone8SixteenState(
        iphone8SixteenModelObj: Iphone8SixteenModel(),
      ))
        ..add(Iphone8SixteenInitialEvent()),
      child: Iphone8SixteenScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Iphone8SixteenBloc, Iphone8SixteenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
            ),
          ),
        );
      },
    );
  }
}
