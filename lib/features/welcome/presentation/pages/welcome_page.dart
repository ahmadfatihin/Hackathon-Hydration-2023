import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_hydration/core/di/routes.dart';
import 'package:hackathon_hydration/features/login/presentation/cubit/login_cubit.dart';
import 'package:hackathon_hydration/themes/textstyles.dart';

import '../../../../themes/pallets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: GetIt.I<LoginCubit>()..getUserData(),
        child: Scaffold(
          appBar: AppBar(title: Text("Hello Novi")),
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: Pallet.gradient),
            child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) => state.maybeWhen(
                    orElse: () {
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.go(RoutesConfig.login);
                          },
                          child: const Text("User Not Found, Back to login"),
                        ),
                      );
                    },
                    loaded: (userData, _) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Water Hoarder",
                                  style: TextStyles.text2XlXtraBold,
                                ),
                                Text(
                                  "Your Height is ${userData.height}",
                                  style: TextStyles.text2XlXtraBold,
                                ),
                                Text(
                                  "Your Weight is ${userData.height}",
                                  style: TextStyles.text2XlXtraBold,
                                ),
                                Text(
                                  "You Need",
                                  style: TextStyles.text2XlXtraBold,
                                ),
                                Text(
                                  "2",
                                  style: TextStyles.text2XlXtraBold,
                                ),
                                Text(
                                  "Liters of \n Water / Day",
                                  style: TextStyles.text2XlXtraBold,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Next"),
                            ),
                          ],
                        ))),
          ),
        ),
      ),
    );
  }
}
