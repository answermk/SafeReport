import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              // Status Bar


              // Header


              // Main content
              Expanded(
                child: _buildMainContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildMainContent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 60),

          // Shield with Key Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF36599F),
              borderRadius: BorderRadius.circular(60),
            ),
            child: CustomPaint(
              painter: ShieldKeyPainter(),
              size: const Size(60, 60),
            ),
          ),

          const SizedBox(height: 40),

          // Title
          const Text(
            'Forgot Your Password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF36599F),
            ),
          ),

          const SizedBox(height: 20),

          // Description
          Text(
            'Enter your email address and we\'ll send you instructions to reset your password.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),

          const SizedBox(height: 40),

          // Email field
          _buildEmailField(),

          const SizedBox(height: 30),

          // Send Reset Link button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Handle send reset link
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF36599F),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Send Reset Link',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Back to Sign In button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                // Navigate back to sign in
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF36599F),
                side: const BorderSide(color: Color(0xFF36599F)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Back to Sign In',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'youremail@gmail.com',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class ShieldKeyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint shieldPaint = Paint()
      ..color = const Color(0xFF36599F)
      ..style = PaintingStyle.fill;

    final Paint keyPaint = Paint()
      ..color = const Color(0xFF5B8CD9) // Lighter blue for the key
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // Draw shield shape
    final Path shieldPath = Path();
    shieldPath.moveTo(size.width * 0.5, size.height * 0.1); // Top point
    shieldPath.lineTo(size.width * 0.8, size.height * 0.3); // Top right
    shieldPath.lineTo(size.width * 0.8, size.height * 0.7); // Right side
    shieldPath.lineTo(size.width * 0.5, size.height * 0.9); // Bottom point
    shieldPath.lineTo(size.width * 0.2, size.height * 0.7); // Left side
    shieldPath.lineTo(size.width * 0.2, size.height * 0.3); // Top left
    shieldPath.close();
    
    canvas.drawPath(shieldPath, shieldPaint);

    // Draw key
    final double keyWidth = size.width * 0.4;
    final double keyHeight = size.height * 0.6;
    final double keyX = size.width * 0.5 - keyWidth / 2;
    final double keyY = size.height * 0.2;

    // Key head (circle)
    canvas.drawCircle(
      Offset(keyX + keyWidth * 0.5, keyY + keyWidth * 0.3),
      keyWidth * 0.25,
      keyPaint,
    );

    // Key shaft
    canvas.drawRect(
      Rect.fromLTWH(
        keyX + keyWidth * 0.4,
        keyY + keyWidth * 0.3,
        keyWidth * 0.2,
        keyHeight * 0.6,
      ),
      keyPaint,
    );

    // Key teeth (simple rectangle)
    canvas.drawRect(
      Rect.fromLTWH(
        keyX + keyWidth * 0.3,
        keyY + keyHeight * 0.7,
        keyWidth * 0.4,
        keyHeight * 0.15,
      ),
      keyPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}