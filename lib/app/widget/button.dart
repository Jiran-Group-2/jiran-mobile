import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:jiran_app/app/core/theme.dart';

class AppButtonRounded extends StatelessWidget {
  const AppButtonRounded({
    super.key,
    required this.onTap,
    this.title = 'OK',
    this.height = 60,
    this.padding = const EdgeInsets.all(0.0),
    this.color, this.width, this.fontSize,
  });

  final Function()? onTap;
  final String title;
  final double height;
  final Color? color;
  final double? width;
  final EdgeInsets padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            border: Border.all(color: AppColors.white.withOpacity(0.8)),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: AutoSizeText(title, style: TextStyle( color: AppColors.white, fontSize: fontSize ?? 16))),
        ),
      ),
    );
  }
}