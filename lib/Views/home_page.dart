import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noise_mute/Views/Widgets/back_ground.dart';
import 'package:noise_mute/Views/Widgets/control_card.dart';
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
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ANC',
                                    style: GoogleFonts.inriaSans(
                                        color: Colors.white,
                                        fontSize: screenSize.width * 0.05),
                                  ),
                                  Text('0 %',
                                      style: GoogleFonts.inriaSans(
                                          color: Colors.white,
                                          fontSize: screenSize.width * 0.05)),
                                ],
                              ),
                              Slider(
                                value: 0,
                                onChanged: (value) {},
                                activeColor: Colors.white,
                                inactiveColor: Colors.white,
                                min: 0,
                                max: 1,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                //heater and massage controls
                Row(
                  spacing: screenSize.width * 0.05,
                  children: [
                    Expanded(
                      child: ControlCard(
                        screenSize: screenSize,
                        title: Text(
                          'Heater',
                          style: GoogleFonts.inriaSans(
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w300),
                        ),
                        icon: SvgPicture.asset('assets/heater.svg',
                            height: screenSize.height * 0.05),
                        title2: Text(''),
                      ),
                    ),
                    Expanded(
                        child: ControlCard(
                      screenSize: screenSize,
                      title: Text(
                        'Massage',
                        style: GoogleFonts.inriaSans(
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w300),
                      ),
                      icon: SvgPicture.asset('assets/massage.svg',
                          height: screenSize.height * 0.05),
                      title2: Text(''),
                    )),
                  ],
                ),
                //music card
                Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                          screenSize: screenSize,
                          color: kMainColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                spacing: screenSize.height * 0.02,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Music Name',
                                    style: GoogleFonts.inriaSans(
                                        fontSize: screenSize.width * 0.05,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.music_note_rounded,
                                        color: Colors.white,
                                        size: screenSize.width * 0.05,
                                      ),
                                      Text(
                                        'Artist',
                                        style: GoogleFonts.inriaSans(
                                            fontSize: screenSize.width * 0.04,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              //music controls
                              Row(
                                spacing: screenSize.width * 0.05,
                                children: [
                                  Icon(
                                    Icons.skip_previous_rounded,
                                    color: Colors.white,
                                    size: screenSize.width * 0.07,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.all(screenSize.width * 0.02),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.play_arrow_rounded,
                                      color: kMainColor,
                                      size: screenSize.width * 0.07,
                                    ),
                                  ),
                                  Icon(
                                    Icons.skip_next_rounded,
                                    color: Colors.white,
                                    size: screenSize.width * 0.07,
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                //preset card
                Row(
                  children: [
                    Expanded(
                        child: ControlCard(
                      screenSize: screenSize,
                      title: Row(
                        // spacing: screenSize.width*0.4,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: screenSize.width * 0.02,
                            children: [
                              Text(
                                'Preset',
                                style: GoogleFonts.inriaSans(
                                    fontSize: screenSize.width * 0.05,
                                    fontWeight: FontWeight.w400),
                              ),
                              SvgPicture.asset(
                                'assets/setting.svg',
                                height: screenSize.height * 0.02,
                              )
                            ],
                          ),
                        ],
                      ),
                      icon: Text(''),
                      title2: Text(
                        'Name',
                        style: GoogleFonts.inriaSans(
                            fontSize: screenSize.width * 0.045,
                            fontWeight: FontWeight.w300),
                      ),
                    )),
                  ],
                ),
                //Start button
                Container(
                  padding: EdgeInsets.all(screenSize.width * 0.08),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kMainColor),
                  child: Text(
                    'Start',
                    style: GoogleFonts.inriaSans(
                        color: Colors.white,
                        fontSize: screenSize.width * 0.07,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
