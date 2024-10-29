import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'appcolors.dart';

// TextTheme appText() {
//   return const TextTheme(
//     displayLarge: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 94,
//         fontWeight: FontWeight.w300,
//         letterSpacing: -1.5),
//     displayMedium: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 59,
//         fontWeight: FontWeight.w300,
//         letterSpacing: -0.5),
//     displaySmall: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 47,
//         fontWeight: FontWeight.w400),
//     headlineMedium: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 33,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.25),
//     headlineSmall: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 24,
//         fontWeight: FontWeight.w400),
//     titleLarge: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 20,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 0.15),
//     titleMedium: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         letterSpacing: 0.15),
//     titleSmall: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 0.1),
//     bodyLarge: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 16,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.5),
//     bodyMedium: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.25),
//     bodySmall: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.4),
//     labelLarge: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 1.25),
//     labelSmall: TextStyle(
//         fontFamily: 'NanumSquareNeo',
//         fontSize: 10,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 1.5),
//   );
// }

class AppText {
  static TextStyle llmText = const TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 16,
    color: AppColors.darkText,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonText = TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 14.sp,
    height: 1.1,
    color: AppColors.darkText,
    fontWeight: FontWeight.w800,
  );

  static TextStyle buttonTextDisabled = TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 14.sp,
    height: 1.1,
    color: AppColors.disabledText,
    fontWeight: FontWeight.w800,
  );

  static TextStyle menuText = TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 16.sp,
    color: AppColors.moduRed,
    fontWeight: FontWeight.w800,
  );

  static TextStyle cartItemText = TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 14.sp,
    color: AppColors.lightText,
    fontWeight: FontWeight.w400,
  );

  static TextStyle productName = const TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 12,
    height: 1.07,
    color: AppColors.darkText,
    fontWeight: FontWeight.w800,
  );

  static TextStyle productDescription = TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 9.sp,
    height: 1.07,
    color: AppColors.darkText,
    fontWeight: FontWeight.w600,
  );

  static TextStyle productPrice = TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 10.sp,
    height: 1.07,
    color: AppColors.darkText,
    fontWeight: FontWeight.w600,
  );
}
