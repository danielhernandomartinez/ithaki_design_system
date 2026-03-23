import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';
import 'ithaki_info_tag.dart';

/// A course card with image, title, tags, description, and metadata.
class IthakiCourseCard extends StatelessWidget {
  final Widget? image;
  final double imageHeight;
  final String title;
  final List<String> tags;
  final String description;
  final String? format;
  final String? duration;
  final String? level;
  final VoidCallback? onTap;

  const IthakiCourseCard({
    super.key,
    this.image,
    this.imageHeight = 160,
    required this.title,
    this.tags = const [],
    required this.description,
    this.format,
    this.duration,
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
        decoration: BoxDecoration(
          border: Border.all(color: IthakiTheme.borderLight),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: imageHeight,
                  width: double.infinity,
                  child: image ??
                      Container(
                        color: IthakiTheme.placeholderBg,
                        child: const Center(
                          child: IthakiIcon('image', size: 48,
                              color: IthakiTheme.placeholderIcon),
                        ),
                      ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: IthakiTheme.textPrimary,
                    ),
                  ),
                  if (tags.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: tags
                          .map((tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: IthakiTheme.borderLight),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: IthakiTheme.textPrimary,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: IthakiTheme.textPrimary,
                      height: 1.4,
                    ),
                  ),

                  // Metadata
                  if (format != null || duration != null || level != null) ...[
                    const SizedBox(height: 12),
                    const Divider(height: 1, color: IthakiTheme.borderLight),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        if (format != null)
                          IthakiInfoTag(
                            icon: IthakiIcon('pc',
                                size: tagIconSize, color: tagIconColor),
                            label: format!,
                          ),
                        if (duration != null)
                          IthakiInfoTag(
                            icon: IthakiIcon('clock',
                                size: tagIconSize, color: tagIconColor),
                            label: duration!,
                          ),
                        if (level != null)
                          IthakiInfoTag(
                            icon: IthakiIcon('level',
                                size: tagIconSize, color: tagIconColor),
                            label: level!,
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
