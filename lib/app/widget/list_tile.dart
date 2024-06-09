

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';

class BillsListTile extends StatelessWidget {
  const BillsListTile({super.key, required this.bill});

  final BillModel bill;

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
                  AutoSizeText(bill.bill?.billSubject ?? 'Building Subdivision', 
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  AutoSizeText(bill.bill?.billDescription ?? 'Personal request upon renovation on tenant\'s property', 
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
                  AutoSizeText('RM ${bill.balance?.toStringAsFixed(2) ?? 0.0.toStringAsFixed(2)}', 
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
  const AppListTile({super.key, this.title, this.subtitle, this.notes, this.onTap});
  
  final String? title;
  final String? subtitle;
  final String? notes;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                    subtitle != null ? AutoSizeText(subtitle!, 
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 10,
                      ),
                      minFontSize: 8,
                    ) : const SizedBox.shrink(),
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
      ),
    );
  }
}

class StatusListTile extends StatelessWidget {
  const StatusListTile({super.key, this.title, this.subtitle, this.status, this.onTap});
  
  final String? title;
  final String? subtitle;
  final Widget? status;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                    subtitle != null ? AutoSizeText(subtitle!, 
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 10,
                      ),
                      minFontSize: 8,
                    ) : const SizedBox.shrink(),
                    status ?? const SizedBox.shrink(),
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
      ),
    );
  }
}