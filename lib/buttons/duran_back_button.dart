import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DuranBackButton extends StatelessWidget {
  const DuranBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        child: IconButton(
            onPressed: (){ context.pop(); },
            icon: const Icon(Icons.arrow_back_rounded)
        ),
      ),
    );
  }
}
