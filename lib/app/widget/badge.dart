import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, this.margin = const EdgeInsets.symmetric(vertical: 4)});

  final String status;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: getStatusColor(status),
      ),
      child: AutoSizeText(
        getStatusText(status),
        style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
      ),
    );
  }

  getStatusColor(String status) {
    switch (status) {
      case 'A':
        return Colors.green;
      case 'P':
        return Colors.orange;
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
        return 'Inactive';
      default:
        return 'Unknown';
    }
  }
}

