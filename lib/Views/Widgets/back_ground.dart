import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
    required this.screenSize,
    required this.child,
  });

  final Size screenSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/backGround.png',
          width: screenSize.width,
          height: screenSize.height,
          fit: BoxFit.fill,
        ),
        child
      ],
    );
  }
}
