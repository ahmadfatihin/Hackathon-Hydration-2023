import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hackathon_hydration/features/login/presentation/cubit/login_cubit.dart';

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
    final name = nameController.text;
    final height = double.tryParse(heightController.text) ?? 0.0;
    final weight = double.tryParse(weightController.text) ?? 0.0;
    final age = int.tryParse(ageController.text) ?? 0;

    final userData = UserData(
      name: nameController.text,
      height: double.tryParse(heightController.text) ?? 0.0,
      weight: double.tryParse(weightController.text) ?? 0.0,
      age: int.tryParse(ageController.text) ?? 0,
    );

    GetIt.I<LoginCubit>().saveUserData(userData: userData);

    GetIt.I<LoginCubit>().saveUserData(userData: userData);

    debugPrint('Name: $name');
    debugPrint('Height: $height');
    debugPrint('Weight: $weight');
    debugPrint('Age: $age');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: heightController,
                  decoration: InputDecoration(labelText: 'Height'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: weightController,
                  decoration: InputDecoration(labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
