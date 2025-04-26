import 'package:flutter/material.dart';
import 'package:noise_mute/consts.dart';

class BluetoothDeviceWidget extends StatelessWidget {
  const BluetoothDeviceWidget({
    super.key,
    required this.screenSize,
    required this.icon,
    required this.title,
  });

  final Size screenSize;
  final Widget icon;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        icon,
      ],
    );
    return Container(
      padding: EdgeInsets.only(
        left: screenSize.width * 0.05,
        top: screenSize.height * 0.02,
        bottom: screenSize.height * 0.02,
        right: screenSize.width * 0.1,
      ),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: row,
    );
  }
}
