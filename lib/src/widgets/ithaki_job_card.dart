import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiJobCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onDelete;

  const IthakiJobCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EAFA),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: IthakiTheme.primaryPurple, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: IthakiTheme.primaryPurple, width: 1),
            ),
            child: const Center(
              child: IthakiIcon('rocket', size: 20, color: IthakiTheme.primaryPurple),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: IthakiTheme.bodySmallSemiBold),
                if (subtitle.isNotEmpty)
                  Text(subtitle, style: IthakiTheme.captionRegular),
              ],
            ),
          ),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: IthakiTheme.textPrimary, width: 1),
              ),
              child: const Center(
                child: IthakiIcon('delete', size: 18, color: IthakiTheme.textSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
