import 'package:flutter/material.dart';
import 'package:marvel/mvp/stateful_page.dart';
import 'package:marvel/widgets/message_dialog.dart';
import 'package:toast/toast.dart';

/// @description 页面相关的方法
///
/// @author 燕文强
///
/// @date 2019-12-13
Future launch(BuildContext context, Widget widget, {bool stack = false}) {
  return Navigator.push(context, _pageRoute(widget, stack));
}

Future launchAndCloseSelf(BuildContext context, Widget widget, {bool stack = false}) {
  return Navigator.pushAndRemoveUntil(context, _pageRoute(widget, stack), (_) => false);
}

void finish(BuildContext context) {
  StatefulPage.routes.removeLast();
  Navigator.pop(context);
}

Route _pageRoute(Widget widget, bool stack) {
  MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) => Scaffold(body: widget));
  if (stack) StatefulPage.routes.add(pageRoute);
  return pageRoute;
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
  int duration = 2,
  Color backgroundColor = const Color(0xAA000000),
  Color textColor = Colors.white,
  double backgroundRadius = 20,
  Border border,
}) {
  Toast.show(msg, context,
      duration: duration,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      backgroundRadius: backgroundRadius,
      border: border);
}

Future<T> showMsg<T>(
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
  return MessageDialog.show<T>(
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
