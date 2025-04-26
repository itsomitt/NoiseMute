import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noise_mute/Views/Widgets/back_ground.dart';
import 'package:noise_mute/Views/Widgets/my_container.dart';
import 'package:noise_mute/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGround(
        screenSize: screenSize,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
                vertical: screenSize.height * 0.01),
            child: Column(
              children: [
                //bluetooth card
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.05,
                            vertical: screenSize.height * 0.02),
                        decoration: BoxDecoration(
                            border: Border.all(color: kMainColor, width: 2),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.05)),
                        child: Row(
                          spacing: screenSize.width * 0.03,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bluetooth_rounded,
                              color: kMainColor,
                              size: screenSize.width * 0.1,
                            ),
                            Text(
                              'Connected',
                              style: GoogleFonts.inriaSans(
                                  color: kMainColor,
                                  fontSize: screenSize.width * 0.045),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //ANC card
                Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                          screenSize: screenSize,
                          color: kMainColor,
                          child: Text('ANC')),
                    ),
                  ],
                ),
                //heater and massage controls
                Row(
                  spacing: screenSize.width * 0.05,
                  children: [
                    Expanded(
                      child: MyContainer(
                        screenSize: screenSize,
                        color: Colors.white,
                        child: Text('Heater'),
                      ),
                    ),
                    Expanded(
                      child: MyContainer(
                        screenSize: screenSize,
                        color: Colors.white,
                        child: Text('Massage'),
                      ),
                    ),
                  ],
                ),
                //music card
                Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                          screenSize: screenSize,
                          color: kMainColor,
                          child: Text('music name')),
                    ),
                  ],
                ),
                //preset card
                Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                          screenSize: screenSize,
                          color: Colors.white,
                          child: Text('Preset')),
                    ),
                  ],
                ),
                //Start button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
