import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noise_mute/Controllers/bluetooth_controller.dart';
import 'package:noise_mute/Views/Widgets/back_ground.dart';
import 'package:noise_mute/Views/Widgets/bluetooth_device.dart';
import 'package:noise_mute/Views/Widgets/loading_popup.dart';
import 'package:noise_mute/Views/Widgets/my_container.dart';
import 'package:noise_mute/Views/home_page.dart';
import 'package:noise_mute/consts.dart';

class BluetoothPage extends ConsumerWidget {
  const BluetoothPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bluetoothController = ref.watch(bluetoothControllerProvider);
    final Size screenSize = MediaQuery.of(context).size;
    bluetoothController.getDevices();
    return Scaffold(
      body: BackGround(
        screenSize: screenSize,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
                vertical: screenSize.height * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyContainer(
                  screenSize: screenSize,
                  color: kMainColor,
                  child: Icon(
                    Icons.bluetooth_rounded,
                    color: Colors.white,
                    size: screenSize.width * 0.3,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Get connected to your ',
                    style: GoogleFonts.inriaSans(
                        fontSize: screenSize.width * 0.05,
                        color: kMainColor,
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: 'Noise Mute',
                          style: GoogleFonts.inriaSans(
                              fontSize: screenSize.width * 0.08,
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                        text: ' device via Bluetooth',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.08),
                  child: Text(
                    'Paired Devices',
                    style: GoogleFonts.inriaSans(
                        color: kMainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.width * 0.04),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: screenSize.height * 0.3,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: () {
                        loadingPopUp(context);
                        try {
                          bluetoothController.disconnect();
                          if (bluetoothController.connection == null) {
                            SnackBar(content: Text('Disconnected from device'));
                          }
                        } catch (e) {
                          log('error in disconnecting: $e');
                        }

                        Navigator.pop(context);
                      },
                      onTap: () async {
                        loadingPopUp(context);
                        await bluetoothController.connectToDevice(
                            bluetoothController.devices[index]);
                        if (bluetoothController.connection != null) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to connect to ${bluetoothController.devices[index].name}'),
                            ),
                          );
                        }
                      },
                      child: BluetoothDeviceWidget(
                        screenSize: screenSize,
                        icon: SvgPicture.asset(
                          'assets/item.svg',
                          width: screenSize.width * 0.07,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        ),
                        title: Text(
                          bluetoothController.devices[index].name!,
                          style: GoogleFonts.inriaSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.05,
                          ),
                        ),
                      ),
                    ),
                    itemCount: bluetoothController.devices.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.05),
                  child: GestureDetector(
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Pair your device with Noise Mute device in Bluetooth settings of your device'),
                            ),
                          ),
                      onDoubleTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage())),
                      child: Text(
                        "Didn't find your device",
                        style: GoogleFonts.poppins(
                          color: Color(0xff717171),
                          fontSize: 15,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
