import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_hydration/core/di/routes.dart';
import 'package:hackathon_hydration/core/ui/custom_loading_animation.dart';
import 'package:hackathon_hydration/features/login/presentation/cubit/login_cubit.dart';
import 'package:hackathon_hydration/features/login/presentation/widgets/login_form.dart';
import 'package:hackathon_hydration/features/login/presentation/widgets/login_qr.dart';

import '../../../../themes/pallets.dart';
import '../../domain/entities/user_entity.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final userData = UserData(
      name: nameController.text,
      height: double.tryParse(heightController.text) ?? 0.0,
      weight: double.tryParse(weightController.text) ?? 0.0,
      age: int.tryParse(ageController.text) ?? 0,
    );

    GetIt.I<LoginCubit>().saveUserData(userData: userData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) => state.mapOrNull(
          success: (value) {
            context.go(RoutesConfig.welcome);
          },
        ),
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(gradient: Pallet.gradient),
                child: Scaffold(
                    appBar: AppBar(
                      title: const Text('Login Screen'),
                      actions: [
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text("USE QR"),
                        ),
                      ],
                    ),
                    body: LoginQrWidget()),
              ),
              Visibility(
                visible:
                    state.maybeWhen(orElse: () => false, loading: (_) => true),
                child: const CustomLoadingAnimation(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
