import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ModernListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final Widget? subtitle;
  final bool isSelected;
  final int syncStatus;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Duration animationDuration;

  const ModernListTile({
    super.key,
    this.leading,
    this.trailing,
    this.title,
    this.subtitle,
    this.isSelected = false,
    this.syncStatus = 0,
    this.onTap,
    this.onLongPress,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
        title: title,
        subtitle: subtitle,
        enableFeedback: true,
        selected: isSelected,
        leading: leading,
        selectedTileColor: colorScheme.primary.withAlpha(30),
        titleTextStyle: theme.textTheme.titleMedium?.copyWith(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? colorScheme.primary : colorScheme.onSurface,

        ),
        trailing: _AnimatedTrailing(
          trailing: trailing,
          isSelected: isSelected,
          syncStatus: syncStatus,
          animationDuration: animationDuration,
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}

class _AnimatedTrailing extends StatelessWidget {
  final Widget? trailing;
  final bool isSelected;
  final int syncStatus;
  final Duration animationDuration;

  const _AnimatedTrailing({
    required this.trailing,
    required this.isSelected,
    required this.syncStatus,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: AnimatedSwitcher(
          duration: animationDuration,
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          child: isSelected
              ? _buildSelectedIcon(context)
              : trailing ?? const SizedBox()
      ),
    );
  }

  Widget _buildSelectedIcon(BuildContext context) {
    return Icon(
      Icons.check_circle,
      color: Theme.of(context).colorScheme.primary,
    ).zoomIn(duration: const Duration(milliseconds: 300));
  }
}