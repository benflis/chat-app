import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class speedS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.transparent,
      elevation: 1,
      overlayOpacity: 0.7,
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          backgroundColor: Colors.blue,
          child: Icon(
            FontAwesomeIcons.facebook,
            color: Colors.white,
          ),
        ),
        SpeedDialChild(
          backgroundColor: Colors.orange,
          child: Icon(
            FontAwesomeIcons.google,
            color: Colors.white,
          ),
        )
      ],
      spacing: 13,
    );
  }
}
