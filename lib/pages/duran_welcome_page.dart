import 'package:flutter/material.dart';

class DuranWelcomePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryButtonText;
  final String secondaryButtonText;
  final bool showPrimaryButton;
  final bool showSecondaryButton;
  final VoidCallback onPrimaryButtonClick;
  final VoidCallback onSecondaryButtonClick;
  final ImageProvider image;

  const DuranWelcomePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.primaryButtonText = "Primary",
    this.secondaryButtonText = "Secondary",
    this.showPrimaryButton = true,
    this.showSecondaryButton = true,
    this.onPrimaryButtonClick = _emptyCallback,
    this.onSecondaryButtonClick = _emptyCallback,
  });

  static void _emptyCallback() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          // Imagen (parte superior)
          Expanded(
            flex: 1,
            child: Image(
              image: image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Parte inferior con canvas y botones
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                // Canvas dibujado en la parte inferior
                Positioned.fill(
                  child: CustomPaint(
                    painter: _WavePainter(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),

                // Contenido sobre el canvas
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.surface.withOpacity(0.8),
                        ),
                      ),
                      const Spacer(),

                      // Botón primario
                      if (showPrimaryButton)
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: FilledButton(
                            onPressed: onPrimaryButtonClick,
                            style: FilledButton.styleFrom(
                              backgroundColor: theme.colorScheme.surface,
                              foregroundColor: theme.colorScheme.onSurface,
                            ),
                            child: Text(primaryButtonText),
                          ),
                        ),

                      if (showSecondaryButton) const SizedBox(height: 16),

                      // Botón secundario
                      if (showSecondaryButton)
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: FilledButton(
                            onPressed: onSecondaryButtonClick,
                            style: FilledButton.styleFrom(
                              backgroundColor: theme.colorScheme.surface,
                              foregroundColor: theme.colorScheme.onSurface,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(secondaryButtonText),
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward_ios),
                                )
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;

  _WavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.4);

    path.quadraticBezierTo(
      size.width * 0.0,
      size.height * 0.2,
      size.width * 0.3,
      size.height * 0.2,
    );

    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.2,
      size.width * 0.7,
      size.height * 0.2,
    );

    path.quadraticBezierTo(
      size.width * 0.99,
      size.height * 0.2,
      size.width,
      0,
    );

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
