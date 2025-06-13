import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DuranDeleteDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final Color? accentColor;

  const DuranDeleteDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText = 'Eliminar',
    this.cancelText = 'Cancelar',
    required this.onConfirm,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = accentColor ?? colorScheme.error;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
      child: AlertDialog(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        backgroundColor: colorScheme.surface,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_rounded,
              size: 60,
              color: accent,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text( content ?? "",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withAlpha(180),
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [

              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(
                      color: colorScheme.outline.withAlpha(50),
                    ),
                  ),
                  child: Text(cancelText),
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onConfirm();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: accent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                  child: Text(
                    confirmText,
                    style: TextStyle(
                      color: colorScheme.onError,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).fadeInUp(),
    );
  }
}