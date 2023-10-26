import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hackathon_hydration/features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:hackathon_hydration/themes/textstyles.dart';

import '../../../../themes/pallets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: GetIt.I<WelcomeCubit>(),
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: Pallet.gradient),
            child: Column(
              children: [
                Text(
                  "Water Hoarder",
                  style: TextStyles.text2XlXtraBold,
                ),
                Text(
                  "Your Height is",
                  style: TextStyles.text2XlXtraBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
