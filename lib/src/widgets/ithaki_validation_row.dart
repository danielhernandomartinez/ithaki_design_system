import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiValidationRow extends StatelessWidget {
  final bool valid;
  final String text;

  const IthakiValidationRow({super.key, required this.valid, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          valid
              ? const IthakiIcon('check', size: 16, color: IthakiTheme.successGreen)
              : const IthakiIcon('x-close', size: 16, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: valid ? IthakiTheme.textPrimary : IthakiTheme.textSecondary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
