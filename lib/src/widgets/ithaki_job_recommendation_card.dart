import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';
import 'ithaki_match_bar.dart';
import 'ithaki_info_tag.dart';

/// A job recommendation card showing company info, job title, salary,
/// match percentage, and metadata tags.
class IthakiJobRecommendationCard extends StatelessWidget {
  final String companyName;
  final String companyInitials;
  final Color companyColor;
  final Widget? companyLogo;
  final String jobTitle;
  final String salary;
  final int matchPercentage;
  final String matchLabel;
  final String? location;
  final String? workMode;
  final String? employmentType;
  final String? level;
  final VoidCallback? onTap;

  const IthakiJobRecommendationCard({
    super.key,
    required this.companyName,
    this.companyInitials = '',
    this.companyColor = IthakiTheme.primaryPurple,
    this.companyLogo,
    required this.jobTitle,
    required this.salary,
    required this.matchPercentage,
    required this.matchLabel,
    this.location,
    this.workMode,
    this.employmentType,
    this.level,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const tagIconColor = IthakiTheme.textPrimary;
    const tagIconSize = 16.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: IthakiTheme.backgroundWhite,
          border: Border.all(color: IthakiTheme.borderLight),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company row
            Row(
              children: [
                companyLogo ??
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: companyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        companyInitials,
                        style: const TextStyle(
                          color: IthakiTheme.backgroundWhite,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    companyName,
                    style: const TextStyle(
                      fontSize: 14,
                      color: IthakiTheme.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Job title
            Text(
              jobTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: IthakiTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 4),

            // Salary
            Text(
              salary,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: IthakiTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            // Match bar
            IthakiMatchBar(
              percentage: matchPercentage,
              label: matchLabel,
            ),
            const SizedBox(height: 14),
            const Divider(height: 1, color: IthakiTheme.borderLight),
            const SizedBox(height: 14),

            // Tags grid (2 columns)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (location != null)
                        IthakiInfoTag(
                          icon: IthakiIcon('location',
                              size: tagIconSize, color: tagIconColor),
                          label: location!,
                        ),
                      if (location != null && employmentType != null)
                        const SizedBox(height: 8),
                      if (employmentType != null)
                        IthakiInfoTag(
                          icon: IthakiIcon('clock',
                              size: tagIconSize, color: tagIconColor),
                          label: employmentType!,
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
                          icon: IthakiIcon('briefcase-work',
                              size: tagIconSize, color: tagIconColor),
                          label: workMode!,
                        ),
                      if (workMode != null && level != null)
                        const SizedBox(height: 8),
                      if (level != null)
                        IthakiInfoTag(
                          icon: IthakiIcon('level',
                              size: tagIconSize, color: tagIconColor),
                          label: level!,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
