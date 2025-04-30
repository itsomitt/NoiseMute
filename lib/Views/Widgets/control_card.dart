import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:noise_mute/Views/Widgets/my_container.dart';
import 'package:noise_mute/consts.dart';

class ControlCard extends StatelessWidget {
  const ControlCard({
    super.key,
    required this.screenSize,
    required this.title,
    required this.icon,
    required this.title2,
  });

  final Size screenSize;
  final Widget title;
  final Widget icon;
  final Widget title2;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      screenSize: screenSize,
      color: Colors.white,
      child: Column(
        spacing: screenSize.height * 0.02,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [title, title2],
          ),
          icon,
          AnimatedToggleSwitch<int>.size(
              iconOpacity: 0.3,
              styleBuilder: (value) => ToggleStyle(
                    backgroundColor: Colors.white,
                    indicatorColor: kMainColor,
                  ),
              borderWidth: 0.0,
              current: 0,
              spacing: 0,
              indicatorSize: Size.fromWidth(screenSize.width * 0.2),
              values: const [0, 1, 2, 3],
              customIconBuilder: (context, local, global) => local.value == 0
                  ? Icon(
                      Icons.not_interested_rounded,
                      color: Color.lerp(
                          Colors.black, Colors.white, local.animationValue),
                    )
                  : Text(
                      local.value.toString(),
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        color: Color.lerp(
                          Colors.black,
                          Colors.white,
                          local.animationValue,
                        ),
                      ),
                    ),
              onChanged: (value) {}
              // ref.read(currentTimePeriodProvider.notifier).update(
              //       (state) => value,
              //     ),
              ),
        ],
      ),
    );
  }
}
