import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

/// A news item tile with tag chip, date, title, and optional thumbnail.
class IthakiNewsTile extends StatelessWidget {
  final String tag;
  final String date;
  final String title;
  final Widget? thumbnail;
  final VoidCallback? onTap;

  const IthakiNewsTile({
    super.key,
    required this.tag,
    required this.date,
    required this.title,
    this.thumbnail,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: tag + date (full width, above the image)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: IthakiTheme.borderLight),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 11,
                    color: IthakiTheme.textSecondary,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: IthakiTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Row 2: title + thumbnail
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: IthakiTheme.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child: thumbnail ??
                      Container(
                        color: IthakiTheme.placeholderBg,
                        child: const Center(
                          child: IthakiIcon('image',
                              size: 24, color: IthakiTheme.placeholderIcon),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
