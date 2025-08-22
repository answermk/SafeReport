 import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final IconData? headerIcon;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.message,
    this.buttonText = 'OK',
    this.onButtonPressed,
    this.headerIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with icon and title
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    headerIcon ?? Icons.person,
                    color: const Color(0xFF2196F3),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Success checkmark icon
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 48,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Success message
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1976D2),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Action button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onButtonPressed ?? () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Specific success dialogs for common use cases
class RespondNowSuccessDialog extends StatelessWidget {
  final VoidCallback? onOKPressed;

  const RespondNowSuccessDialog({
    Key? key,
    this.onOKPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      title: 'Respond Now',
      message: 'Responded successfully!',
      buttonText: 'OK',
      onButtonPressed: onOKPressed,
      headerIcon: Icons.person,
    );
  }
}

class AssignCaseSuccessDialog extends StatelessWidget {
  final VoidCallback? onOKPressed;

  const AssignCaseSuccessDialog({
    Key? key,
    this.onOKPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      title: 'Assign Case',
      message: 'Case Assigned to you!',
      buttonText: 'OK',
      onButtonPressed: onOKPressed,
      headerIcon: Icons.person,
    );
  }
}
