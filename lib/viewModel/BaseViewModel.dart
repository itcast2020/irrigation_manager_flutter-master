import 'package:flutter/widgets.dart';

///所有 viewModel 的父类，提供一些公共功能
///author: Jalor
///抽类
abstract class BaseViewModel {

  bool _isFirst = true;

  bool get isFirst => _isFirst;

  @mustCallSuper
  void init(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      doInit(context);
    }
  }

  ///获取数据
  @protected
  Future getData(BuildContext context);

  @protected
  void doInit(BuildContext context);

  void dispose();
}