import 'package:flutter/material.dart';


/// Exposes the [fetch] method.
extension FetchContext on BuildContext{
  T fetch<T>(){
    return InheritedController.of(this);
  }
}

/// Custom inherited controller provider
class InheritedController extends InheritedWidget {
  final Map<Type, Object> _controllers;
  InheritedController({
    Key key,
    List controllers,
    Widget child,
  })  :
      _controllers = {}..addEntries(controllers
          .map((e) => MapEntry(e.runtimeType, e))),
      super(key: key, child: child);

  static T of<T>(BuildContext context){
    final result = context
        .dependOnInheritedWidgetOfExactType<InheritedController>()
        ._controllers[T];
    return result;
  }

  @override
  bool updateShouldNotify(InheritedController old) {
    return false;
  }
}
