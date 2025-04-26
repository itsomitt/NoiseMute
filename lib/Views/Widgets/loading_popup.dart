import 'package:flutter/material.dart';
import 'package:noise_mute/consts.dart';

Future<dynamic> loadingPopUp(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => PopScope(
      canPop: false,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: kMainColor,
        ),
      ),
    ),
  );
}
