import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

/// Small uppercase section label used in settings screens.
class IthakiSettingsSection extends StatelessWidget {
  final String label;
  const IthakiSettingsSection(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          letterSpacing: 1,
          color: IthakiTheme.textSecondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// White rounded card used in settings screens.
class IthakiSettingsCard extends StatelessWidget {
  final List<Widget> children;
  const IthakiSettingsCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: IthakiTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }
}

/// Thin divider used between settings list items.
class IthakiSettingsDivider extends StatelessWidget {
  const IthakiSettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
        height: 1, indent: 16, endIndent: 16, color: IthakiTheme.borderLight);
  }
}
