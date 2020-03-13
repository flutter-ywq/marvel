import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @description View
///
/// @author 燕文强
///
/// @date 2019-12-11
mixin View {
  void showMsg(
    String msg, {
    String title,
    String positiveText = '确定',
    String negativeText,
    Function positivePressEvent,
    Function negativePressEvent,
    bool barrierDismissible = false,
  });

  void toast(
    String msg, {
    int gravity = 1,
    int duration = 1,
    Color backgroundColor = const Color(0xAA000000),
    Color textColor = Colors.white,
    double backgroundRadius = 20,
    Border border,
  });

  update({tag, params});

  Future launch(Widget widget);

  Future launchAndCloseSelf(Widget widget);

  BuildContext getContext();
}
