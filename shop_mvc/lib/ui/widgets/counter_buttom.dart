import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final int counter;
  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;

  const CounterButton({
    Key key,
    this.counter,
    this.label,
    this.icon,
    this.onPressed
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (child, animation)=>FadeTransition(
            child: child, opacity: animation,
          ),
        child: counter == 0
            ? SizedBox.shrink()
            : Container(
                key: UniqueKey(),
                padding: const EdgeInsets.all(4),
                decoration: counterBox,
                child: Text(counter.toString()??''),
              ),
      ),
    );
  }
}

const BoxDecoration counterBox = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.red,
    boxShadow: [
      BoxShadow(spreadRadius: 2, color: Color(0xFF2E7D32), blurRadius: 5)
    ]);
