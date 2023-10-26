import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hackathon_hydration/core/widget/button.dart';
import 'package:hackathon_hydration/features/home/presentation/cubit/home_cubit.dart';
import 'package:hackathon_hydration/generated/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = GetIt.I<HomeCubit>();
  CollectionReference reference =
      FirebaseFirestore.instance.collection('waterhoarder');

  @override
  void initState() {
    cubit.initData();
    reference.snapshots().listen((querySnapshot) {
      debugPrint('changes: ${querySnapshot.docs.first.data()}');
      cubit.drink();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.drinks == cubit.drinkPerDay) {
            cubit.reverseWolky();
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
              title: Text(
                'Hello ${state.name}!',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active),
                )
              ],
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                Assets.bg
                    .image(fit: BoxFit.fitHeight, height: double.maxFinite),
                Positioned(
                  bottom: 0,
                  child: Stack(
                    children: [
                      Assets.grass.image(),
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.green.withOpacity(0.1 * state.grassGreen),
                            BlendMode.srcIn),
                        child: Assets.grass.image(),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: state.rain,
                  child: Assets.rain.lottie(
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        Assets.wolkk.image(),
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1 * state.drinks),
                              BlendMode.srcIn),
                          child: Assets.wolkk.image(),
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: state.doneForToday ? 0 : 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: AppButton(
                          onPressed: cubit.drink,
                          text: 'DRINK !!!',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
