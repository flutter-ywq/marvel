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
  Widget content;

  MessageDialog._({
    this.title = '',
    this.message = '',
    this.positiveText = '',
    this.negativeText = '',
    this.positivePressEvent,
    this.negativePressEvent,
    this.content,
  });

  static Future<T> show<T>({
    @required BuildContext context,
    String title,
    String message,
    String positiveText = '确定',
    String negativeText,
    bool barrierDismissible = false,
    Function positivePressEvent,
    Function negativePressEvent,
    Widget content,
    bool backDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
            child: MessageDialog._(
              title: title,
              message: message,
              positiveText: positiveText,
              negativeText: negativeText,
              positivePressEvent: positivePressEvent,
              negativePressEvent: negativePressEvent,
              content: content,
            )._show<T>(context),
            onWillPop: (){
              return Future.value(backDismissible);
            }
        );
      },
    );
  }

  Widget _show<T>(BuildContext context) {
    if (content == null) {
      content = message == null
          ? null
          : Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: Text(message,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            )),
      );
    }
    return CupertinoAlertDialog(
      title: title == null
          ? null
          : Container(
        margin: EdgeInsets.only(bottom: 10, top: 8),
        child: Text(title, style: TextStyle(fontSize: 17.0)),
      ),
      content: content,
      actions: _actions<T>(
        context,
        positiveText,
        negativeText,
        positivePressEvent,
        negativePressEvent,
      ),
    );
  }

  List<Widget> _actions<T>(
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
          T result;
          if (positivePressEvent != null) {
            result = positivePressEvent();
          }
          Navigator.of(context).pop(result);
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
            T result;
            if (negativePressEvent != null) {
              result = negativePressEvent();
            }
            Navigator.of(context).pop(result);
          },
        ),
      );
    }
    return actions;
  }
}