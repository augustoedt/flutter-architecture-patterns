import 'package:flutter/material.dart';

class Dropdown<T> extends StatefulWidget {
  final List<T> items;
  final ValueChanged<T> onSelected;

  const Dropdown({Key key, this.items, this.onSelected(T)}) : super(key: key);

  @override
  _DropdownState<T> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown<T>> {
  int indexValue = 0;
  T value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value ?? widget.items.first,
      items: List.generate(widget.items.length, (index) {
        return DropdownMenuItem(
            value: widget.items[index],
            child: Text(widget.items[index].toString()));
      }),
      onChanged: (T selected) {
        widget.onSelected(selected);
        this.value = selected;
        setState(() {});
      },
    );
  }
}
