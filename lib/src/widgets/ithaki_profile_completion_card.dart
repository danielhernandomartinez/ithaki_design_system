import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_hatch_progress_bar.dart';
import 'ithaki_button.dart';

class IthakiProfileChecklistItem {
  final String label;
  final bool completed;
  const IthakiProfileChecklistItem({required this.label, required this.completed});
}

/// Two-section card: white checklist on top, #daccf8 welcome section below.
class IthakiProfileCompletionCard extends StatelessWidget {
  final List<IthakiProfileChecklistItem> items;
  final List<String> benefits;
  final VoidCallback? onFillProfile;

  const IthakiProfileCompletionCard({
    super.key,
    required this.items,
    required this.benefits,
    this.onFillProfile,
  });

  @override
  Widget build(BuildContext context) {
    final completed = items.where((i) => i.completed).length;
    final progress = items.isEmpty ? 0.0 : completed / items.length;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: const Color(0xFFDACCF8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── White section: progress + checklist ─────────
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Complete your profile',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: IthakiTheme.textPrimary),
                    ),
                    const SizedBox(height: 10),
                    IthakiHatchProgressBar(progress: progress),
                    const SizedBox(height: 12),
                    ...items.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 22, height: 22,
                            decoration: BoxDecoration(
                              color: item.completed ? IthakiTheme.textPrimary : IthakiTheme.softGray,
                              shape: BoxShape.circle,
                            ),
                            child: item.completed
                                ? const Icon(Icons.check, size: 14, color: Colors.white)
                                : null,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 14,
                              color: item.completed ? IthakiTheme.textPrimary : IthakiTheme.textSecondary,
                              fontWeight: item.completed ? FontWeight.w500 : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),

            // ─── #daccf8 section: welcome + benefits + button ─
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to Ithaki!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: IthakiTheme.textPrimary),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Fill in the missing information to unlock your full experience on the platform. A complete profile helps you get better job matches and more employer invitations.",
                    style: TextStyle(fontSize: 13, color: IthakiTheme.textSecondary, height: 1.5),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Benefits of completing your profile',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: IthakiTheme.textPrimary),
                  ),
                  const SizedBox(height: 8),
                  ...benefits.map((b) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check, size: 16, color: IthakiTheme.primaryPurple),
                        const SizedBox(width: 8),
                        Expanded(child: Text(b, style: const TextStyle(fontSize: 13, color: IthakiTheme.textSecondary, height: 1.4))),
                      ],
                    ),
                  )),
                  const SizedBox(height: 14),
                  IthakiButton('Fill Profile', onPressed: onFillProfile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
