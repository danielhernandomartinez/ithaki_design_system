import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

/// Data for a single stat row inside [IthakiStatCard].
class IthakiStatRowData {
  final Widget icon;
  final String label;
  final int value;
  final int? change;

  const IthakiStatRowData({
    required this.icon,
    required this.label,
    required this.value,
    this.change,
  });
}

/// A card displaying a list of stat rows with icon, label, value,
/// and optional change badge. Each row is an individual bordered container.
class IthakiStatCard extends StatelessWidget {
  final String title;
  final List<IthakiStatRowData> rows;

  const IthakiStatCard({
    super.key,
    required this.title,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: IthakiTheme.headingMedium),
        const SizedBox(height: 12),
        for (int i = 0; i < rows.length; i++) ...[
          _buildRow(rows[i]),
          if (i < rows.length - 1) const SizedBox(height: 8),
        ],
      ],
    );
  }

  Widget _buildRow(IthakiStatRowData row) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: IthakiTheme.borderLight),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Center(child: row.icon),
          ),
          const SizedBox(width: 12),
          Text(
            row.label,
            style: const TextStyle(
              fontSize: 14,
              color: IthakiTheme.textSecondary,
            ),
          ),
          const Spacer(),
          Text(
            '${row.value}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: IthakiTheme.textPrimary,
            ),
          ),
          if (row.change != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: IthakiTheme.badgeLime,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '+${row.change}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: IthakiTheme.textPrimary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
