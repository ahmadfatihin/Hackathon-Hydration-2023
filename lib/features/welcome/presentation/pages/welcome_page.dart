import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathon_hydration/themes/textstyles.dart';

import '../../../../themes/pallets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: Pallet.gradient),
          child: Column(
            children: [
              Text(
                "Water Hoarder",
                style: TextStyles.text2XlXtraBold,
              ),
              const Placeholder(),
            ],
          ),
        ),
      ),
    );
  }
}
