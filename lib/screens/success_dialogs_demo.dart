import 'package:flutter/material.dart';
import '../components/success_dialog.dart';

class SuccessDialogsDemo extends StatelessWidget {
  const SuccessDialogsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF424242), // Dark gray background like in the image
      appBar: AppBar(
        title: const Text('Success Dialogs Demo'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            
            // Header
            const Text(
              'Success Dialog Components',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 16),
            
            const Text(
              'These components match the design from your UI frames',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 60),
            
            // Demo buttons
            _buildDemoButton(
              context,
              'Show "Respond Now" Dialog',
              Icons.check_circle,
              () => _showRespondNowDialog(context),
            ),
            
            const SizedBox(height: 20),
            
            _buildDemoButton(
              context,
              'Show "Assign Case" Dialog',
              Icons.assignment,
              () => _showAssignCaseDialog(context),
            ),
            
            const SizedBox(height: 20),
            
            _buildDemoButton(
              context,
              'Show Custom Success Dialog',
              Icons.add,
              () => _showCustomSuccessDialog(context),
            ),
            
            const SizedBox(height: 20),
            
            _buildDemoButton(
              context,
              'Show Success Dialog with Custom Action',
              Icons.settings,
              () => _showCustomActionDialog(context),
            ),
            
            const Spacer(),
            
            // Footer info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    'Features:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• Consistent design matching your UI frames\n'
                    '• Reusable components for different use cases\n'
                    '• Customizable titles, messages, and actions\n'
                    '• Responsive layout with proper spacing\n'
                    '• Dark background overlay for focus',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1976D2),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }

  void _showRespondNowDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const RespondNowSuccessDialog(),
    );
  }

  void _showAssignCaseDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AssignCaseSuccessDialog(),
    );
  }

  void _showCustomSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const SuccessDialog(
        title: 'Custom Success',
        message: 'This is a custom success message with different content!',
        buttonText: 'Continue',
        headerIcon: Icons.star,
      ),
    );
  }

  void _showCustomActionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: 'Custom Action',
        message: 'This dialog has a custom action when you press the button!',
        buttonText: 'Proceed',
        headerIcon: Icons.rocket_launch,
        onButtonPressed: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Custom action executed!'),
              backgroundColor: Color(0xFF4CAF50),
            ),
          );
        },
      ),
    );
  }
}
