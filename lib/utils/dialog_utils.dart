import 'package:flutter/material.dart';
import '../components/success_dialog.dart';

class DialogUtils {
  /// Shows a success dialog with the "Respond Now" message
  static void showRespondNowSuccess(BuildContext context, {VoidCallback? onOKPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => RespondNowSuccessDialog(onOKPressed: onOKPressed),
    );
  }

  /// Shows a success dialog with the "Assign Case" message
  static void showAssignCaseSuccess(BuildContext context, {VoidCallback? onOKPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AssignCaseSuccessDialog(onOKPressed: onOKPressed),
    );
  }

  /// Shows a custom success dialog
  static void showCustomSuccess(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onButtonPressed,
    IconData? headerIcon,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: title,
        message: message,
        buttonText: buttonText,
        onButtonPressed: onButtonPressed,
        headerIcon: headerIcon,
      ),
    );
  }

  /// Shows a success dialog for case resolution
  static void showCaseResolvedSuccess(BuildContext context, {VoidCallback? onOKPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: 'Case Resolved',
        message: 'Case has been successfully resolved!',
        buttonText: 'OK',
        onButtonPressed: onOKPressed,
        headerIcon: Icons.verified,
      ),
    );
  }

  /// Shows a success dialog for evidence submission
  static void showEvidenceSubmittedSuccess(BuildContext context, {VoidCallback? onOKPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: 'Evidence Submitted',
        message: 'Evidence has been successfully uploaded!',
        buttonText: 'OK',
        onButtonPressed: onOKPressed,
        headerIcon: Icons.upload_file,
      ),
    );
  }

  /// Shows a success dialog for report submission
  static void showReportSubmittedSuccess(BuildContext context, {VoidCallback? onOKPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: 'Report Submitted',
        message: 'Your report has been successfully submitted!',
        buttonText: 'OK',
        onButtonPressed: onOKPressed,
        headerIcon: Icons.report,
      ),
    );
  }

  /// Shows a success dialog for officer assignment
  static void showOfficerAssignedSuccess(BuildContext context, {VoidCallback? onOKPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: 'Officer Assigned',
        message: 'Officer has been successfully assigned to this case!',
        buttonText: 'OK',
        onButtonPressed: onOKPressed,
        headerIcon: Icons.person_add,
      ),
    );
  }

  /// Shows a success dialog for status update
  static void showStatusUpdatedSuccess(BuildContext context, {VoidCallback? onOKPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: 'Status Updated',
        message: 'Case status has been successfully updated!',
        buttonText: 'OK',
        onButtonPressed: onOKPressed,
        headerIcon: Icons.update,
      ),
    );
  }
}
