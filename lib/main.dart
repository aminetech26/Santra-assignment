import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santra_assignment/presentation/santra_assignment.dart';
import 'di/get_it.dart' as get_it;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(get_it.initDependencies());
  runApp(const SantraAssignmentApp());
}
