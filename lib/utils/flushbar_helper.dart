import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:another_flushbar/flushbar.dart';

class FlushbarHelper{

  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(15),
          duration: Duration(seconds: 2),
          message: message,
        )..show(context));
  }
}