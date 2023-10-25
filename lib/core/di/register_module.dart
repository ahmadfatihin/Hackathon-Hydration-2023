import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Box<dynamic>> get hive async => Hive.box('com.wolkk.hydration');
}
