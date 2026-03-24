import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';
import 'ithaki_match_bar.dart';
import 'ithaki_info_tag.dart';

/// A job listing card used in the Job Search screen.
///
/// Shows posted time, company logo + title + company name, salary,
/// match bar, category chip, metadata tags, and Save/View action buttons.
class IthakiJobSearchCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String salary;
  final int matchPercentage;
  final String matchLabel;
  final List<Color>? matchGradientColors;
  final Color? matchBackgroundColor;
  final String? category;
  final String? location;
  final String? workMode;
  final String? employmentType;
  final String? level;
  final String postedAgo;
  final Widget? companyLogo;
  final bool isSaved;
  final VoidCallback? onSave;
  final VoidCallback? onView;

  const IthakiJobSearchCard({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.salary,
    required this.matchPercentage,
    required this.matchLabel,
    this.matchGradientColors,
    this.matchBackgroundColor,
    this.category,
    this.location,
    this.workMode,
    this.employmentType,
    this.level,
    this.postedAgo = 'Posted 1 day ago',
    this.companyLogo,
    this.isSaved = false,
    this.onSave,
    this.onView,
  });

  @override
  Widget build(BuildContext context) {
    const tagIconColor = IthakiTheme.graphite;
    const tagIconSize = 16.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: IthakiTheme.borderLight),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Posted time
          Text(
            postedAgo,
            style: const TextStyle(
              fontSize: 13,
              color: IthakiTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 10),

          // Company logo + Job title + Company name
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo placeholder
              companyLogo ??
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: IthakiTheme.softGray,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: const IthakiIcon(
                      'briefcase-work',
                      size: 32,
                      color: IthakiTheme.lightGraphite,
                    ),
                  ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: IthakiTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      companyName,
                      style: const TextStyle(
                        fontSize: 14,
                        color: IthakiTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: IthakiTheme.lightGray),
          const SizedBox(height: 14),

          // Salary
          Text(
            salary,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: IthakiTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          // Match bar
          IthakiMatchBar(
            percentage: matchPercentage,
            label: matchLabel,
            gradientColors: matchGradientColors ??
                const [Color(0xFF50C948), IthakiTheme.matchGreen],
            backgroundColor: matchBackgroundColor ?? IthakiTheme.matchBarBg,
            showPercentage: matchPercentage > 0,
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: IthakiTheme.lightGray),
          const SizedBox(height: 14),
          // Category chip
          if (category != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: IthakiTheme.badgeLime,
                ),
                child: Text(
                  category!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: IthakiTheme.textPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Info tags grid (2 columns)
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (location != null)
                      IthakiInfoTag(
                        icon: const IthakiIcon('location',
                            size: tagIconSize, color: tagIconColor),
                        label: location!,
                        color: IthakiTheme.textPrimary,
                      ),
                    if (location != null && employmentType != null)
                      const SizedBox(height: 8),
                    if (employmentType != null)
                      IthakiInfoTag(
                        icon: const IthakiIcon('clock',
                            size: tagIconSize, color: tagIconColor),
                        label: employmentType!,
                        color: IthakiTheme.textPrimary,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (workMode != null)
                      IthakiInfoTag(
                        icon: const IthakiIcon('briefcase-work',
                            size: tagIconSize, color: tagIconColor),
                        label: workMode!,
                        color: IthakiTheme.textPrimary,
                      ),
                    if (workMode != null && level != null)
                      const SizedBox(height: 8),
                    if (level != null)
                      IthakiInfoTag(
                        icon: const IthakiIcon('level',
                            size: tagIconSize, color: tagIconColor),
                        label: level!,
                        color: IthakiTheme.textPrimary,
                      ),
                  ],
                ),
              ),
            ],
          ),

          // Action buttons
          if (onSave != null || onView != null) ...[
            const SizedBox(height: 14),
            const Divider(height: 1, color: IthakiTheme.lightGray),
            const SizedBox(height: 14),
            Row(
              children: [
                if (onSave != null)
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: OutlinedButton(
                        onPressed: onSave,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isSaved
                                ? IthakiTheme.primaryPurple
                                : IthakiTheme.softGraphite,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IthakiIcon(
                              'bookmark',
                              size: 18,
                              color: isSaved
                                  ? IthakiTheme.primaryPurple
                                  : IthakiTheme.graphite,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isSaved ? 'Saved' : 'Save Job',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSaved
                                    ? IthakiTheme.primaryPurple
                                    : IthakiTheme.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (onSave != null && onView != null) const SizedBox(width: 10),
                if (onView != null)
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: onView,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: IthakiTheme.primaryPurple,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'View Job',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
