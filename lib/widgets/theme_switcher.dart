import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSwitcher extends StatelessWidget {
  final ValueNotifier<bool>? controller;
  const ThemeSwitcher({super.key, required this.controller});

  Text textChild(String label) {
    return Text(
      label,
      style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: controller,
      activeImage: const AssetImage('assets/day_sky.png'),
      inactiveImage: const AssetImage('assets/night_sky.jpg'),
      activeColor: Colors.green,
      inactiveColor: Colors.grey,
      activeChild: textChild('Day'),
      inactiveChild: textChild('Night'),
      borderRadius: const BorderRadius.all(Radius.circular(1000)),
      width: 90.0,
      height: 40.0,
      enabled: true,
      disabledOpacity: 0.5,
    );
  }
}
