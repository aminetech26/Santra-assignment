import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:santra_assignment/presentation/themes/app_colors.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: Colors.white, // Replace with your desired color
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0.0),
  textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: 15.sp, color: Colors.white),
      displayMedium:
          GoogleFonts.poppins(fontSize: 15.sp, color: AppColors.secondaryColor)),
);
