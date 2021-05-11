import 'package:flutter/material.dart';


/// Exposes the [fetch] method.
extension FetchContext on BuildContext{
  T fetch<T>(){
    return InheritedProvider.of(this);
  }
}

/// Custom inherited controller provider
class InheritedProvider extends InheritedWidget {
  final Map<Type, Object> _controllers;
  InheritedProvider({
    Key key,
    List controllers,
    Widget child,
  })  :
      _controllers = {}..addEntries(controllers
          .map((e) => MapEntry(e.runtimeType, e))),
      super(key: key, child: child);

  static T of<T>(BuildContext context){
    final result = context
        .dependOnInheritedWidgetOfExactType<InheritedProvider>()
        ._controllers[T];
    return result;
  }

  @override
  bool updateShouldNotify(InheritedProvider old) {
    return false;
  }
}
