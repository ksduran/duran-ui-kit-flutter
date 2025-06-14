import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lordicon/lordicon.dart';

class DuranInfoDialog extends StatefulWidget {
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;
  final Color? accentColor;

  const DuranInfoDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText = 'Aceptar',
    required this.onConfirm,
    this.accentColor,
  });

  @override
  State<DuranInfoDialog> createState() => _DuranInfoDialogState();
}

class _DuranInfoDialogState extends State<DuranInfoDialog> {

  final iconController = IconController.assets("assets/lotties/error_outline.json");

  @override void initState() {
    super.initState();
    iconController.addStatusListener(iconListener);
  }

  @override void dispose() {
    iconController.removeStatusListener(iconListener);
    iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = widget.accentColor ?? colorScheme.primary;

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
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text( widget.content,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withAlpha(180),
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onConfirm();
            },
            style: FilledButton.styleFrom(
              backgroundColor: accent,
              padding: const EdgeInsets.symmetric(vertical: 14),
              elevation: 0,
            ),
            child: Text(
              widget.confirmText,
              style: TextStyle(
                color: colorScheme.onError,
              ),
            ),
          ),
        ],
      ).fadeInUp(),
    );
  }

  void iconListener(ControllerStatus status) {
    if(status == ControllerStatus.ready) {
      iconController.playFromBeginning();
    }
  }

}

