import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mvc_provider/controller/cart_controller.dart';

class CounterButton extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;

  const CounterButton({
    Key key,
    this.label,
    this.icon,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int counter = context.select((CartController cc) => cc.totalCartItems);
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
                key: ValueKey<int>(counter),
                padding: const EdgeInsets.all(4),
                decoration: counterBox,
                child: Text(counter.toString()),
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
