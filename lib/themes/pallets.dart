import 'package:flutter/material.dart';

class Pallet {
  //Primaries

  static Color get primary => const Color(0xFF5B64EE);

  static Color get secondary => const Color(0xFF2970FF);

  static Color get neutral => const Color(0xFFECECEC);

  //Secondaries

  static Color get success => const Color(0xFF16B364);

  static Color get error => const Color(0xFF9B2828);

  static Color get process => const Color(0xFFB9792A);

  static LinearGradient get gradient => const LinearGradient(
        colors: [Color(0xFF47B8C5), Color(0xFF70E7F4)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  //Backgrounds

  static Color get primaryBg => const Color(0xFFC0F9FF);

  static Color get successBg => const Color(0xFFAAF0C4);

  static Color get errorBg => const Color(0xFFEABABA);

  static Color get processBg => const Color(0xFFFFDEB7);

  static Color get secondBg => const Color(0xFFC8DAFF);

  static Color get lightBg => const Color(0xFFFFFFFF);

  static Color get disableBg => const Color(0xFFF7F7F7);

  //Text&Others

  static Color get textDark => const Color(0xFF3C3C3C);

  static Color get textGrey => const Color(0xFF909090);

  static Color get textLight => const Color(0xFFFFFFFF);

  static Color get border => const Color(0xFFE3E3E3);

  static Color get darkBorder => const Color(0xFFD2D2D2);

  static Color get whiteScaffold => const Color(0xFFF7F7FC);

  //Disable

  static Color get disablePrimary => const Color(0xFFCED1FA);

  static Color get disableSecondary => const Color(0xFF84CAFF);

  static LinearGradient get disableGradient => const LinearGradient(
        stops: [0.0374, 0.967],
        transform: GradientRotation(107.13 * 3.1415927 / 180),
        colors: [Color(0xFFA3DCE2), Color(0xFFB6F1F8)],
      );

  static Color get disableError => const Color(0xFFCD9393);

  static Color get disableSuccess => const Color(0xFF8ECBC1);

  static Color get disableProcess => const Color(0xFFDBBB94);

  // Put other colors that duplicate, but have different implementation here
  static Color get transparent => const Color(0x00000000);

  static Color get white => const Color(0xFFFFFFFF);

  static Color get black => const Color(0xFF000000);

  static Color get tabBarBg => const Color(0xFFEEEEEE);

  static Color get disablePaymentGrey => const Color(0xFFF1F1F1);
}
