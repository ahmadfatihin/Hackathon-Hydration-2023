import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, this.height, this.logo, this.width});

  final double? height;
  final Image? logo;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return logo ?? Assets.logo.image(height: height, width: width);
  }
}
