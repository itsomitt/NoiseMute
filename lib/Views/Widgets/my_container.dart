import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.screenSize,
    required this.color,
    required this.child,
  });

  final Size screenSize;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.02),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.blueGrey,
                blurRadius: 1,
              )
            ],
            color: color,
            borderRadius: BorderRadius.circular(screenSize.width * 0.05)),
        child: child);
  }
}
