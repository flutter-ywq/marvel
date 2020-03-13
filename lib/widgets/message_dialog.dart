import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @description MessageDialog
///
/// @author 燕文强
///
/// @date 2020-01-29
// ignore: must_be_immutable
class MessageDialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function positivePressEvent;
  Function negativePressEvent;

  MessageDialog._({
    this.title = '',
    this.message = '',
    this.positiveText = '',
    this.negativeText = '',
    this.positivePressEvent,
    this.negativePressEvent,
  });

  static void show({
    @required BuildContext context,
    String title,
    String message,
    String positiveText = '确定',
    String negativeText,
    bool barrierDismissible = false,
    Function positivePressEvent,
    Function negativePressEvent,
  }) {
    showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return MessageDialog._(
          title: title,
          message: message,
          positiveText: positiveText,
          negativeText: negativeText,
          positivePressEvent: positivePressEvent,
          negativePressEvent: negativePressEvent,
        )._show(context);
      },
    );
  }

  Widget _show(BuildContext context) {
    return CupertinoAlertDialog(
      title: title == null
          ? null
          : Container(
              margin: EdgeInsets.only(bottom: 10, top: 8),
              child: Text(title, style: TextStyle(fontSize: 18.0)),
            ),
      content: message == null
          ? null
          : Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Text(message,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
      actions: _actions(
        context,
        positiveText,
        negativeText,
        positivePressEvent,
        negativePressEvent,
      ),
    );
  }

  List<Widget> _actions(
    BuildContext context,
    String positiveText,
    String negativeText,
    Function positivePressEvent,
    Function negativePressEvent,
  ) {
    List<Widget> actions = <Widget>[
      CupertinoDialogAction(
        child: Text(
          positiveText,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16.0,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          if (positivePressEvent != null) {
            positivePressEvent();
          }
        },
      ),
    ];

    if (negativeText != null) {
      actions.insert(
        0,
        CupertinoDialogAction(
          child: Text(
            negativeText,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 16.0,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            if (negativePressEvent != null) {
              negativePressEvent();
            }
          },
        ),
      );
    }
    return actions;
  }
}
