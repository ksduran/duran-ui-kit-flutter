import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const RoundedTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.textInputAction,
    this.maxLength,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      readOnly: readOnly,
      maxLength: maxLength,
      validator: validator,
      obscureText: obscureText,
      style: theme.textTheme.bodyLarge,
      onTap: onTap,
      decoration: InputDecoration(
        fillColor: theme.colorScheme.outline.withAlpha(20),
        filled: true,
        labelText: label,
        labelStyle: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade400),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: theme.colorScheme.primary) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: theme.colorScheme.secondary) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: theme.colorScheme.outline.withAlpha(20)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: theme.colorScheme.outline.withAlpha(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      ),
    );
  }
}