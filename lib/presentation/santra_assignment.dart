import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santra_assignment/presentation/journeys/home_screen.dart';
import 'package:santra_assignment/presentation/themes/app_theme.dart';

class SantraAssignmentApp extends StatelessWidget {
  const SantraAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Santra Assignment',
          theme: appTheme,
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
