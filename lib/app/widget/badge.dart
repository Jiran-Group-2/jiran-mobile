import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, this.margin = const EdgeInsets.symmetric(vertical: 4), this.borderRadius = 4, this.fontSize});

  final String status;
  final EdgeInsets margin;
  final double borderRadius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: getStatusColor(status),
      ),
      child: AutoSizeText(
        getStatusText(status),
        style: TextStyle(color: Colors.white, fontSize: fontSize ?? 11, fontWeight: FontWeight.bold),
        minFontSize: 4,
      ),
    );
  }

  getStatusColor(String status) {
    switch (status) {
      case 'A':
        return Colors.green;
      case 'P':
        return Colors.orange;
      case 'I':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  getStatusText(String status) {
    switch (status) {
      case 'A':
        return 'Approved';
      case 'P':
        return 'Pending Approval';
      case 'I':
        return 'Rejected';
      default:
        return 'Unknown';
    }
  }
}

