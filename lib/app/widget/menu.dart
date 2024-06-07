import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jiran_app/app/core/theme.dart';

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({super.key, this.title, this.icon, this.onTap});

  final String? title;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title ?? 'Item',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.tertiary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100)
                        ),
                      ),
                      icon ?? const Icon(Icons.ac_unit, size: 60),
                    ],
                  ),
                ),
              ),
              AutoSizeText(
                title ?? 'Item', textAlign: TextAlign.center, maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}