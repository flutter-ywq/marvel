import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel/marvel.dart';
import 'package:marvel/utils/logger.dart';
import 'view.dart';
import 'package:marvel/common/common.dart' as prefix0;

/// @description 有状态的
///
/// @author 燕文强
///
/// @date 2019-12-11
abstract class Stateful<T extends StatefulWidget, P extends Presenter> extends State<T> with View, WidgetsBindingObserver {
  bool bindingObserver = false;

  P presenter;

  Future<T> showMsg<T>(
    String msg, {
    String title,
    String positiveText = '确定',
    String negativeText,
    Function positivePressEvent,
    Function negativePressEvent,
    bool barrierDismissible = false,
  }) {
    return prefix0.showMsg<T>(context, msg,
        title: title,
        positiveText: positiveText,
        negativeText: negativeText,
        positivePressEvent: positivePressEvent,
        negativePressEvent: negativePressEvent);
  }

  void toast(
    String msg, {
    int gravity = 1,
    int duration = 1,
    Color backgroundColor = const Color(0xAA000000),
    Color textColor = Colors.white,
    double backgroundRadius = 20,
    Border border,
  }) {
    prefix0.toast(context, msg,
        gravity: gravity,
        duration: duration,
        backgroundColor: backgroundColor,
        textColor: textColor,
        backgroundRadius: backgroundRadius,
        border: border);
  }

  showSnackBar(String text) {
    prefix0.showSnackBar(context, text);
  }

  @override
  void initState() {
    super.initState();
    presenter = initPresenter();
    prepare();
    if (bindingObserver) {
      logFormat('bind WidgetsBindingObserver');
      WidgetsBinding.instance.addObserver(this);
    }

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      viewDidLoad(callback);
    });
  }

  void prepare() {}

  P initPresenter();

  viewDidLoad(callback);

  updateState(tag, params) {}

  @override
  void dispose() {
    super.dispose();
    if (bindingObserver) {
      logFormat('remove WidgetsBindingObserver');
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  @override
  update({tag, params}) {
    setState(() => updateState(tag, params));
  }

  @override
  Future launch(Widget widget, {bool stack = false}) {
    return prefix0.launch(context, widget, stack: stack);
  }

  @override
  Future launchAndCloseSelf(Widget widget, {bool stack = false}) {
    return prefix0.launchAndCloseSelf(context, widget, stack: stack);
  }

  @override
  bool finish() {
    prefix0.finish(context);
    return null;
  }

  @override
  BuildContext getContext() => this.context;

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log('lifecycle changed: $state');
  }

  @override
  void didChangeLocales(List<Locale> locale) {}

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {}

  @override
  void didChangeTextScaleFactor() {}

  @override
  void didHaveMemoryPressure() {}
}
