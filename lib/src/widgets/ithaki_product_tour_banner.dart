import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';
import 'ithaki_button.dart';

/// A dismissable product tour card shown to new users.
class IthakiProductTourBanner extends StatelessWidget {
  final VoidCallback? onStart;
  final VoidCallback? onDismiss;

  const IthakiProductTourBanner({
    super.key,
    this.onStart,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IthakiTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IthakiIcon('rocket',
                  size: 20, color: IthakiTheme.primaryPurple),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Start product tour',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: IthakiTheme.textPrimary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onDismiss,
                child: const IthakiIcon('x-close',
                    size: 18, color: IthakiTheme.softGraphite),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Learn how to use the platform and find jobs faster.',
            style: TextStyle(fontSize: 14, color: IthakiTheme.textSecondary),
          ),
          const SizedBox(height: 14),
          IthakiButton('Start Product Tour', onPressed: onStart),
        ],
      ),
    );
  }
}
