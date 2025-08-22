# Success Dialog Components

This directory contains reusable success dialog components that match the design from your UI frames.

## Components

### SuccessDialog
The main reusable success dialog component with customizable:
- Title
- Message
- Button text
- Header icon
- Custom button action

### RespondNowSuccessDialog
Pre-configured dialog for "Respond Now" success messages.

### AssignCaseSuccessDialog
Pre-configured dialog for "Assign Case" success messages.

## Usage

### Basic Usage
```dart
import '../components/success_dialog.dart';

// Show the basic success dialog
showDialog(
  context: context,
  builder: (context) => const SuccessDialog(
    title: 'Success',
    message: 'Operation completed successfully!',
  ),
);
```

### Using Pre-configured Dialogs
```dart
import '../components/success_dialog.dart';

// Show "Respond Now" success
showDialog(
  context: context,
  builder: (context) => const RespondNowSuccessDialog(),
);

// Show "Assign Case" success
showDialog(
  context: context,
  builder: (context) => const AssignCaseSuccessDialog(),
);
```

### Using DialogUtils (Recommended)
```dart
import '../utils/dialog_utils.dart';

// Show pre-configured dialogs
DialogUtils.showRespondNowSuccess(context);
DialogUtils.showAssignCaseSuccess(context);

// Show custom success dialogs
DialogUtils.showCustomSuccess(
  context,
  title: 'Custom Title',
  message: 'Custom message here',
  buttonText: 'Continue',
  headerIcon: Icons.star,
);

// Show specific success dialogs
DialogUtils.showCaseResolvedSuccess(context);
DialogUtils.showEvidenceSubmittedSuccess(context);
DialogUtils.showReportSubmittedSuccess(context);
DialogUtils.showOfficerAssignedSuccess(context);
DialogUtils.showStatusUpdatedSuccess(context);
```

### Custom Button Actions
```dart
DialogUtils.showCustomSuccess(
  context,
  title: 'Custom Action',
  message: 'This dialog has a custom action!',
  buttonText: 'Proceed',
  onButtonPressed: () {
    Navigator.of(context).pop();
    // Your custom logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Custom action executed!')),
    );
  },
);
```

## Design Features

- **Consistent Styling**: Matches your UI frame design exactly
- **White Card**: Rounded corners with proper padding
- **Header Section**: Icon and title with light blue background
- **Green Checkmark**: Large circular success indicator
- **Dark Blue Button**: Consistent with your color scheme
- **Responsive Layout**: Adapts to different screen sizes
- **Accessibility**: Proper contrast and readable text

## Color Scheme

- **Primary Blue**: `#1976D2` (Button background, text)
- **Light Blue**: `#E3F2FD` (Header icon background)
- **Green**: `#4CAF50` (Success checkmark)
- **White**: `#FFFFFF` (Card background, button text)
- **Dark Gray**: `#424242` (Demo page background)

## Integration Examples

### In Case Management
```dart
// After successfully assigning a case
DialogUtils.showAssignCaseSuccess(context, onOKPressed: () {
  Navigator.of(context).pop();
  // Navigate to case details or refresh list
});
```

### In Report Submission
```dart
// After citizen submits a report
DialogUtils.showReportSubmittedSuccess(context, onOKPressed: () {
  Navigator.of(context).pop();
  // Show confirmation or navigate to dashboard
});
```

### In Evidence Upload
```dart
// After evidence is uploaded
DialogUtils.showEvidenceSubmittedSuccess(context, onOKPressed: () {
  Navigator.of(context).pop();
  // Refresh evidence list or show next steps
});
```

## Demo Page

Use `SuccessDialogsDemo` page to test all dialog variations:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const SuccessDialogsDemo()),
);
```

## Customization

To create new pre-configured dialogs, extend the `SuccessDialog` class:

```dart
class CustomSuccessDialog extends StatelessWidget {
  final VoidCallback? onOKPressed;

  const CustomSuccessDialog({Key? key, this.onOKPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      title: 'Your Title',
      message: 'Your message here',
      buttonText: 'Your Button Text',
      onButtonPressed: onOKPressed,
      headerIcon: Icons.your_icon,
    );
  }
}
```

## Best Practices

1. **Use DialogUtils**: Provides consistent API and pre-configured dialogs
2. **Custom Actions**: Implement custom logic in `onButtonPressed` callback
3. **Navigation**: Handle navigation after dialog dismissal
4. **Consistency**: Use these components for all success messages
5. **Accessibility**: Ensure proper contrast and readable text
