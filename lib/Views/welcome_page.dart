import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noise_mute/Views/Widgets/back_ground.dart';
import 'package:noise_mute/Views/bluetooth_page.dart';
import 'package:permission_handler/permission_handler.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Permission.bluetoothScan.request();
    Permission.bluetoothConnect.request();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BluetoothPage(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGround(
        screenSize: screenSize,
        child: SvgPicture.asset(
          'assets/logo.svg',
          width: screenSize.width * 0.5,
        ),
      ),
    );
  }
}
