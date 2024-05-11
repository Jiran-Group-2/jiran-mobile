import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

class AppColors {
  static const Color primary = Color(0xFF3563E9);
  static const Color secondary = Color(0xFF102E7A);
  static const Color tertiary = Color(0xFF3563E9);
  static const Color background = AppColors.white;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const MaterialColor grey = Colors.grey;
  static const MaterialColor red = Colors.red;
  static const MaterialColor blue = Colors.blue;
  static const MaterialColor orange = Colors.orange;
  static const MaterialColor yellow = Colors.yellow;
  static const MaterialColor green = Colors.green;
  static const Color facebookBlue = Color(0XFF4267B2);
  static const Color transparent = Colors.transparent;
  static Color boxShadow = Colors.grey.shade500;
}

class AppTheme {
  static const double boxShadowBlurRadius = 3;
  static const Offset boxShadowBlurOffset = Offset(1, 2);
  static BoxShadow boxShadow = BoxShadow(
      color: AppColors.boxShadow,
      blurRadius: boxShadowBlurRadius,
      offset: AppTheme.boxShadowBlurOffset);
  static DateFormat dateTimeFormat = DateFormat('dd-MM-yyyy h:mm a');
  static DateFormat dateFormat = DateFormat('yyyy-MM-dd');



  static MaterialColor appSwatch = MaterialColor(AppColors.primary.value, {
    50: AppColors.primary.withOpacity(.1),
    100: AppColors.primary.withOpacity(.2),
    200: AppColors.primary.withOpacity(.3),
    300: AppColors.primary.withOpacity(.4),
    400: AppColors.primary.withOpacity(.5),
    500: AppColors.primary.withOpacity(.6),
    600: AppColors.primary.withOpacity(.7),
    700: AppColors.primary.withOpacity(.8),
    800: AppColors.primary.withOpacity(.9),
    900: AppColors.primary.withOpacity(1),
  });

  static ThemeData primaryTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: const MaterialColor(0xFF3563E9, {
        50: Color(0xFFEAFCE2),
        100: Color(0xFFD7F2BA),
        200: Color(0xFFC4E890),
        300: Color(0xFFB0DF67),
        400: Color(0xFF9DDB3D),
        500: Color(0xFF8AD713),
        600: Color(0xFF7BC800),
        700: Color(0xFF6AB500),
        800: Color(0xFF5AA100),
      }),
      accentColor: const Color(0xFFD7F2BA),
      backgroundColor: const Color(0xFFF8F9FC)
    ),
    useMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily
  );

}