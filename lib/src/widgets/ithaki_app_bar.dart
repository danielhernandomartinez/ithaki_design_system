import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final bool showMenuAndAvatar;
  final bool menuOpen;
  final bool profileOpen;
  final String title;
  final String avatarInitials;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onAvatarPressed;

  const IthakiAppBar({
    super.key,
    this.actionLabel,
    this.onActionPressed,
    this.showMenuAndAvatar = false,
    this.menuOpen = false,
    this.profileOpen = false,
    this.title = 'Ithaki',
    this.avatarInitials = 'AA',
    this.onMenuPressed,
    this.onAvatarPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: topPadding + 8, left: 16, right: 16, bottom: 8),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: IthakiTheme.backgroundWhite,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLeading(context) ?? const SizedBox(width: 12),
                  const Spacer(),
                  ..._buildActions(),
                ],
              ),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (showMenuAndAvatar) {
      return GestureDetector(
        onTap: onMenuPressed,
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(left: 4),
          decoration: menuOpen
              ? BoxDecoration(
                  color: const Color(0xFFF6F2FE),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF905CFF), width: 1.5),
                )
              : null,
          child: Center(
            child: IthakiIcon(
              'menu',
              size: 22,
              color: menuOpen ? const Color(0xFF905CFF) : IthakiTheme.textPrimary,
            ),
          ),
        ),
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
        GestureDetector(
          onTap: onAvatarPressed,
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: profileOpen
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFF905CFF), width: 2),
                  )
                : null,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: IthakiTheme.successGreen,
              child: Text(
                avatarInitials,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              style: const TextStyle(
                color: IthakiTheme.textPrimary,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ];
    }
    return [];
  }
}
