import 'package:flutter/material.dart';

class DuranWelcomePage extends StatelessWidget {
  final Widget image;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;

  const DuranWelcomePage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        color: Colors.white,
        width: 280,
        child: Column(
          children: [
            // Imagen superior
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: image,
            ),

            // Parte inferior curvada
            Stack(
              children: [
                CustomPaint(
                  size: Size(double.infinity, 200),
                  painter: BottomCurvePainter(),
                ),
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: onPressed,
                        child: Text(buttonText),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0D1128); // Dark background

    final path = Path()
      ..moveTo(0, 40)
      ..quadraticBezierTo(size.width * 0.5, 0, size.width, 40)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
