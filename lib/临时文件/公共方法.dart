import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

ToastFuture devToast(String msg,BuildContext context){
  return  showToast(msg,
      duration:const Duration(milliseconds: 2000),
      textStyle:const TextStyle(fontSize: 12,color: Colors.white),
      context: context,
      animation: StyledToastAnimation.fade,
      curve: Curves.linear,
      reverseCurve: Curves.linear
  );
}