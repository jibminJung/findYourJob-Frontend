import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kwansang/bloc/waiting/waiting_bloc.dart';
import 'package:kwansang/bloc/waiting/waiting_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WaitingScreen extends StatelessWidget {
  String imgPath;
  String gender;
  bool agreeYn;

  WaitingScreen(this.imgPath, this.gender, this.agreeYn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("관상"),
      ),
      body: Stack(children: [
        BlocListener<WaitingBloc, WaitingState>(
          listenWhen: (previousState, state) {
            return true;
          },
          listener: (context, state) {
            if (state is WaitingInitial) {
              log("waiting init!!");
            } else if (state is FileUploadErrorState) {
              log("FileUploadErrorState!!");
              FToast()
                ..init(context)
                ..showToast(child: Text("Error Occurred", style: TextStyle(backgroundColor: Colors.grey,)));
            }
          },
          child: const SizedBox(),
        ),
        LinearPercentIndicator(
          width: 140.0,
          lineHeight: 14.0,
          percent: 0.5,
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
      ]),
    );
  }
}
