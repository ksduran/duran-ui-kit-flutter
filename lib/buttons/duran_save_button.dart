import 'package:flutter/material.dart';

class DuranSaveButton extends StatelessWidget {
  const DuranSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(onPressed: (){}, child: Text("Save"));
  }
}
