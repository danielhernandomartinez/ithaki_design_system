import 'dart:io';

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
  final String? avatarUrl;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationsPressed;
  final VoidCallback? onAvatarPressed;
  final GlobalKey? menuKey;
  final GlobalKey? avatarKey;
  final bool showBackButton;

  const IthakiAppBar({
    super.key,
    this.actionLabel,
    this.onActionPressed,
    this.showMenuAndAvatar = false,
    this.menuOpen = false,
    this.profileOpen = false,
    this.title = 'Ithaki',
    this.avatarInitials = 'AA',
    this.avatarUrl,
    this.onMenuPressed,
    this.onNotificationsPressed,
    this.onAvatarPressed,
    this.menuKey,
    this.avatarKey,
    this.showBackButton = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: IthakiTheme.transparent,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 4,
            left: 16,
            right: 16,
            bottom: 4),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: IthakiTheme.backgroundWhite,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: IthakiTheme.appBarShadow,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: showMenuAndAvatar
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildLeading(context)!,
                        const Spacer(),
                        ..._buildActions(),
                      ],
                    ),
                    Text(title, style: IthakiTheme.appBarTitle),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (showBackButton)
                      _buildLeading(context)!
                    else
                      const SizedBox(width: 16),
                    Text(title, style: IthakiTheme.appBarTitle),
                    const Spacer(),
                    ..._buildActions(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (showBackButton) {
      return GestureDetector(
        onTap: onMenuPressed ?? () => Navigator.of(context).pop(),
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(left: 4),
          child: const Center(
            child: IthakiIcon('back-chevron',
                size: 22, color: IthakiTheme.textPrimary),
          ),
        ),
      );
    }
    if (showMenuAndAvatar) {
      return GestureDetector(
        key: menuKey,
        behavior: HitTestBehavior.opaque,
        onTap: onMenuPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: menuOpen
                    ? BoxDecoration(
                        color: IthakiTheme.backgroundViolet,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: IthakiTheme.primaryPurple, width: 1.5),
                      )
                    : null,
                child: Center(
                  child: IthakiIcon(
                    'menu',
                    size: 22,
                    color: menuOpen
                        ? IthakiTheme.primaryPurple
                        : IthakiTheme.textPrimary,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return null;
  }

  ImageProvider? _avatarImage() {
    final value = avatarUrl?.trim();
    if (value == null || value.isEmpty) return null;

    final uri = Uri.tryParse(value);
    if (uri != null && (uri.isScheme('http') || uri.isScheme('https'))) {
      return NetworkImage(value);
    }

    final file = uri != null && uri.isScheme('file')
        ? File(uri.toFilePath())
        : File(value);
    if (!file.existsSync()) return null;
    return FileImage(file);
  }

  List<Widget> _buildActions() {
    if (showMenuAndAvatar) {
      final avatarImage = _avatarImage();

      return [
        IconButton(
          icon: const IthakiIcon('notifications-bell', size: 22),
          onPressed: onNotificationsPressed,
        ),
        GestureDetector(
          key: avatarKey,
          onTap: onAvatarPressed,
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: profileOpen
                    ? IthakiTheme.primaryPurple
                    : IthakiTheme.transparent,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: IthakiTheme.successGreen,
              backgroundImage: avatarImage,
              child: avatarImage == null
                  ? Text(
                      avatarInitials,
                      style: const TextStyle(
                        color: IthakiTheme.foregroundWhite,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
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
