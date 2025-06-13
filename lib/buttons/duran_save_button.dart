import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.enabled,
    required this.onPressed
  });
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: IconButton(
        onPressed: enabled ? onPressed : null,
        icon: const Icon(Icons.save_rounded),
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
