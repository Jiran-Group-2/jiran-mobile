

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jiran_app/app/core/theme.dart';

class BillsListTile extends StatelessWidget {
  const BillsListTile({super.key, this.title, this.subtitle, this.price});
  
  final String? title;
  final String? subtitle;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(title ?? 'Building Subdivision', 
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  AutoSizeText(subtitle ?? 'Personal request upon renovation on tenant\'s property', 
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),
                ],
              ),
            )
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText('RM ${price ?? 0.0}', 
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  const Icon(Icons.chevron_right_rounded, size: 32, color: AppColors.secondary)
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  const AppListTile({super.key, this.title, this.subtitle, this.notes});
  
  final String? title;
  final String? subtitle;
  final String? notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(title ?? 'Building Subdivision', 
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  AutoSizeText(subtitle ?? 'Personal request upon renovation on tenant\'s property', 
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),
                  notes != null ? AutoSizeText(notes ?? 'This is a note', 
                    style: TextStyle(
                      color: AppColors.grey.shade600,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ) : const SizedBox.shrink(),
                ],
              ),
            )
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.chevron_right_rounded, size: 32, color: AppColors.secondary)
          ),
        ],
      ),
    );
  }
}