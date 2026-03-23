import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';
import 'ithaki_flag.dart';

class IthakiNavItem {
  final String icon;
  final String label;
  final String route;
  final int? badge;

  const IthakiNavItem({
    required this.icon,
    required this.label,
    required this.route,
    this.badge,
  });
}

class IthakiNavDrawer extends StatelessWidget {
  final String currentRoute;
  final List<IthakiNavItem> items;
  final double profileProgress;
  final String languageLabel;
  final String languageFlagCode;
  final VoidCallback? onLanguageTap;
  final void Function(IthakiNavItem item)? onItemTap;

  const IthakiNavDrawer({
    super.key,
    required this.currentRoute,
    required this.items,
    this.profileProgress = 0.25,
    this.languageLabel = 'English',
    this.languageFlagCode = 'gb',
    this.onLanguageTap,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Drawer(
      backgroundColor: IthakiTheme.backgroundViolet,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: topPadding + 24),

          // ─── Nav Items ───────────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final item = items[i];
                final selected = item.route == currentRoute;
                return _NavTile(
                  item: item,
                  selected: selected,
                  onTap: () {
                    Navigator.of(context).pop();
                    onItemTap?.call(item);
                  },
                );
              },
            ),
          ),

          // ─── Profile Completion ──────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _ProfileCompletionCard(progress: profileProgress),
          ),
          const SizedBox(height: 12),

          // ─── Language Selector ───────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _LanguageTile(
              flagCode: languageFlagCode,
              label: languageLabel,
              onTap: onLanguageTap,
            ),
          ),
          SizedBox(height: bottomPadding + 16),
        ],
      ),
    );
  }
}

// ─── Nav Tile ────────────────────────────────────────────────────────────────

class _NavTile extends StatelessWidget {
  final IthakiNavItem item;
  final bool selected;
  final VoidCallback onTap;

  const _NavTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFCCFF00) : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              IthakiIcon(
                item.icon,
                size: 20,
                color: selected ? IthakiTheme.textPrimary : IthakiTheme.textPrimary,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    color: IthakiTheme.textPrimary,
                  ),
                ),
              ),
              if (item.badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: const BoxDecoration(
                    color: IthakiTheme.textPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${item.badge}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Profile Completion Card ─────────────────────────────────────────────────

class _ProfileCompletionCard extends StatelessWidget {
  final double progress;

  const _ProfileCompletionCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    final pct = (progress * 100).round();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Complete your profile',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: IthakiTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: 20,
              child: Stack(
                children: [
                  // Hatched background
                  CustomPaint(
                    size: const Size(double.infinity, 20),
                    painter: _HatchPainter(),
                  ),
                  // Green filled portion
                  FractionallySizedBox(
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCFF00),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '$pct%',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: IthakiTheme.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = const Color(0xFFE8E8E8);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);

    final paint = Paint()
      ..color = const Color(0xFFD0D0D0)
      ..strokeWidth = 1.5;

    const spacing = 8.0;
    for (double x = -size.height; x < size.width + size.height; x += spacing) {
      canvas.drawLine(Offset(x, size.height), Offset(x + size.height, 0), paint);
    }
  }

  @override
  bool shouldRepaint(_HatchPainter old) => false;
}

// ─── Language Tile ───────────────────────────────────────────────────────────

class _LanguageTile extends StatelessWidget {
  final String flagCode;
  final String label;
  final VoidCallback? onTap;

  const _LanguageTile({
    required this.flagCode,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          IthakiFlag(flagCode, width: 28, height: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: IthakiTheme.textPrimary,
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 20, color: IthakiTheme.textSecondary),
        ],
      ),
    );
  }
}
