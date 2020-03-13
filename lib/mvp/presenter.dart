import 'view.dart';
import 'model.dart';

/// @description Presenter
///
/// @author 燕文强
///
/// @date 2019-12-11

abstract class Presenter<V extends View, M extends Model> {
  /// View
  final V view;

  /// Model
  final M model;

  Presenter(this.view, this.model);
}
