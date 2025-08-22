import 'package:flutter/material.dart';
import 'officer_dashboard.dart';
import 'all_cases.dart';
import 'tactical_map.dart';
import 'settings_profile.dart';
import 'active_queue.dart';
import 'case_details.dart';
import 'resolved_cases.dart';
import 'officer_comms.dart';
import 'evidence_hub.dart';
import 'live_alerts.dart';
import 'status_updates.dart';
import 'watch_groups.dart';
import 'active_cases.dart';
import 'dispatch_center.dart';
import 'traffic_route.dart';
import 'analytics_insights.dart';
import 'field_report.dart';
import 'media_capture.dart';
import 'citizen_chat.dart';
import 'notification_settings.dart';
import 'shift_management.dart';
import 'team_roster.dart';
import 'reports_exports.dart';
import 'offline_sync.dart';
import 'help_training.dart';
import 'security_privacy.dart';
import 'success_dialogs_demo.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 2; // Start with Home (Officer Dashboard)

  final List<Widget> _screens = [
    const SettingsProfile(), // Setup
    const AllCases(),        // Cases
    const OfficerDashboard(), // Home
    const TacticalMap(),     // Map
    const OfficerComms(),    // Comms
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.settings, 'Setup', 0),
          _buildNavItem(Icons.diamond, 'Cases', 1),
          _buildNavItem(Icons.home, 'Home', 2),
          _buildNavItem(Icons.location_on, 'Map', 3),
          _buildNavItem(Icons.chat_bubble, 'Comms', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isActive ? 56 : 40,
            height: isActive ? 56 : 40,
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF1E3A8A) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey[600],
              size: isActive ? 28 : 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? const Color(0xFF1E3A8A) : Colors.grey[600],
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Helper class to navigate to different screens
class NavigationHelper {
  static void navigateToActiveQueue(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ActiveQueue()));
  }

  static void navigateToCaseDetails(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CaseDetails()));
  }

  static void navigateToResolvedCases(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ResolvedCases()));
  }

  static void navigateToEvidenceHub(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const EvidenceHub()));
  }

  static void navigateToLiveAlerts(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LiveAlerts()));
  }

  static void navigateToStatusUpdates(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const StatusUpdates()));
  }

  static void navigateToWatchGroups(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const WatchGroups()));
  }

  static void navigateToActiveCases(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ActiveCases()));
  }

  static void navigateToDispatchCenter(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DispatchCenter()));
  }

  static void navigateToTrafficRoute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const TrafficRoute()));
  }

  static void navigateToAnalyticsInsights(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AnalyticsInsights()));
  }

  static void navigateToFieldReport(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const FieldReport()));
  }

  static void navigateToMediaCapture(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MediaCapture()));
  }

  static void navigateToCitizenChat(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CitizenChat()));
  }

  static void navigateToNotificationSettings(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationSettings()));
  }

  static void navigateToShiftManagement(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ShiftManagement()));
  }

  static void navigateToTeamRoster(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const TeamRoster()));
  }

  static void navigateToReportsExports(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsExports()));
  }

  static void navigateToOfflineSync(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OfflineSync()));
  }

  static void navigateToHelpTraining(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpTraining()));
  }

  static void navigateToSecurityPrivacy(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecurityPrivacy()));
  }

  static void navigateToSuccessDialogsDemo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessDialogsDemo()));
  }
} 