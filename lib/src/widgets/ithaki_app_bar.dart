import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final bool showMenuAndAvatar;
  final String title;
  final String avatarInitials;

  const IthakiAppBar({
    super.key,
    this.actionLabel,
    this.onActionPressed,
    this.showMenuAndAvatar = false,
    this.title = 'Ithaki',
    this.avatarInitials = 'AA',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 4, left: 16, right: 16, bottom: 4),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: IthakiTheme.backgroundWhite,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLeading() ?? const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: IthakiTheme.appBarTitle,
                ),
              ),
              ..._buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildLeading() {
    if (showMenuAndAvatar) {
      return IconButton(
        icon: const IthakiIcon('menu', size: 22),
        onPressed: () {},
      );
    }
    return null;
  }

  List<Widget> _buildActions() {
    if (showMenuAndAvatar) {
      return [
        IconButton(
          icon: const IthakiIcon('notifications-bell', size: 22),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: IthakiTheme.successGreen,
            child: Text(
              avatarInitials,
              style: IthakiTheme.badgeLabel,
            ),
          ),
        ),
      ];
    }
    if (actionLabel != null) {
      return [
        TextButton(
          onPressed: onActionPressed,
          child: Container(
            padding: const EdgeInsets.only(bottom: 3),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: IthakiTheme.textPrimary, width: 1.2),
              ),
            ),
            child: Text(
              actionLabel!,
              style: IthakiTheme.bodySmall,
            ),
          ),
        ),
      ];
    }
    return [];
  }
}
