import 'package:flutter/material.dart';
import 'package:marvel/widgets/message_dialog.dart';
import 'package:toast/toast.dart';

/// @description 页面相关的方法
///
/// @author 燕文强
///
/// @date 2019-12-13
Future launch(BuildContext context, Widget widget) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Scaffold(body: widget);
  }));
}

Future launchAndCloseSelf(BuildContext context, Widget widget) {
  return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Scaffold(body: widget)), (_) => false);
}

showSnackBar(BuildContext context, String text) {
  return Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1500),
      content: Text(text),
    ),
  );
}

void toast(
  BuildContext context,
  String msg, {
  int gravity = 1,
  int duration = 1,
  Color backgroundColor = const Color(0xAA000000),
  Color textColor = Colors.white,
  double backgroundRadius = 20,
  Border border,
}) {
  Toast.show(msg, context,
      duration: 2,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      backgroundRadius: backgroundRadius,
      border: border);
}

void showMsg(
  BuildContext context,
  String msg, {
  String title,
  String positiveText = '确定',
  String negativeText,
  Function positivePressEvent,
  Function negativePressEvent,
  bool barrierDismissible = false,
}) {
  msg = msg ?? '';
  MessageDialog.show(
    context: context,
    title: title,
    message: msg,
    positiveText: positiveText,
    negativeText: negativeText,
    positivePressEvent: positivePressEvent,
    negativePressEvent: negativePressEvent,
    barrierDismissible: barrierDismissible,
  );
}
