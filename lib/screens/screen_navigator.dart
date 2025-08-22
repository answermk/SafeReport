import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'active_cases.dart';
import 'active_queue.dart';
import 'all_cases.dart';
import 'analytics_insights.dart';
import 'case_details.dart';
import 'citizen_chat.dart';
import 'dashboard_config.dart';
import 'dispatch_center.dart';
import 'evidence_hub.dart';
import 'field_report.dart' as field_report;
import 'group_chat_screen.dart';
import 'help_support_screen.dart';
import 'help_training.dart';
import 'live_alerts.dart';
import 'main_navigation.dart';
import 'media_capture.dart';
import 'notification_settings.dart';
import 'officer_dashboard.dart';
import 'offline_sync.dart';
import 'profile_edit_screen.dart';
import 'reports_exports.dart';
import 'resolved_cases.dart';
import 'security_privacy.dart';
import 'shift_management.dart';
import 'status_updates.dart';
import 'team_roster.dart';
import 'traffic_route.dart';
import 'watch_groups.dart';
import 'success_dialogs_demo.dart';
import 'live_incident_feed.dart';
import 'emergency_response_dashboard.dart';
import 'crime_pattern_analysis.dart';
import 'predictive_policing.dart';
import 'anonymous_tip_processing.dart';
import 'mobile_field_operations.dart';

class ScreenNavigator extends StatelessWidget {
  const ScreenNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      appBar: AppBar(
        title: const Text(
          'Screen Navigator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 24),
              
              // Main Navigation
              _buildCategory(
                context,
                'Main Navigation',
                Icons.home,
                Colors.blue,
                [
                  _buildScreenTile(context, 'Main Navigation', MainNavigation()),
                  _buildScreenTile(context, 'Officer Dashboard', OfficerDashboard()),
                ],
              ),
              
              // Case Management
              _buildCategory(
                context,
                'Case Management',
                Icons.folder,
                Colors.green,
                [
                  _buildScreenTile(context, 'All Cases', AllCases()),
                  _buildScreenTile(context, 'Active Cases', ActiveCases()),
                  _buildScreenTile(context, 'Active Queue', ActiveQueue()),
                  _buildScreenTile(context, 'Resolved Cases', ResolvedCases()),
                  _buildScreenTile(context, 'Case Details', CaseDetails()),
                ],
              ),
              
              // Communication
              _buildCategory(
                context,
                'Communication',
                Icons.chat,
                Colors.orange,
                [
                  _buildScreenTile(context, 'Citizen Chat', CitizenChat()),
                  _buildScreenTile(context, 'Group Chat', GroupChatScreen()),
                  _buildScreenTile(context, 'Officer Comms', OfficerDashboard()),
                ],
              ),
              
              // Operations
              _buildCategory(
                context,
                'Operations',
                Icons.work,
                Colors.red,
                [
                  _buildScreenTile(context, 'Dispatch Center', DispatchCenter()),
                  _buildScreenTile(context, 'Live Alerts', LiveAlerts()),
                  _buildScreenTile(context, 'Field Report', field_report.FieldReport()),
                  _buildScreenTile(context, 'Media Capture', MediaCapture()),
                  _buildScreenTile(context, 'Status Updates', StatusUpdates()),
                  _buildScreenTile(context, 'Live Incident Feed', LiveIncidentFeed()),
                  _buildScreenTile(context, 'Emergency Response', EmergencyResponseDashboard()),
                  _buildScreenTile(context, 'Mobile Field Operations', MobileFieldOperations()),
                ],
              ),
              
              // Intelligence
              _buildCategory(
                context,
                'Intelligence',
                Icons.analytics,
                Colors.purple,
                [
                  _buildScreenTile(context, 'Analytics Insights', AnalyticsInsights()),
                  _buildScreenTile(context, 'Evidence Hub', EvidenceHub()),
                  _buildScreenTile(context, 'Watch Groups', WatchGroups()),
                  _buildScreenTile(context, 'Tactical Map', OfficerDashboard()),
                  _buildScreenTile(context, 'Crime Pattern Analysis', CrimePatternAnalysis()),
                  _buildScreenTile(context, 'Predictive Policing', PredictivePolicing()),
                  _buildScreenTile(context, 'Anonymous Tips', AnonymousTipProcessing()),
                ],
              ),
              
              // Management
              _buildCategory(
                context,
                'Management',
                Icons.settings,
                Colors.teal,
                [
                  _buildScreenTile(context, 'Team Roster', TeamRoster()),
                  _buildScreenTile(context, 'Shift Management', ShiftManagement()),
                  _buildScreenTile(context, 'Traffic Route', TrafficRoute()),
                  _buildScreenTile(context, 'Reports & Exports', ReportsExports()),
                ],
              ),
              
              // Support & Settings
              _buildCategory(
                context,
                'Support & Settings',
                Icons.help,
                Colors.indigo,
                [
                  _buildScreenTile(context, 'Help & Support', HelpSupportScreen()),
                  _buildScreenTile(context, 'Help & Training', HelpTraining()),
                  _buildScreenTile(context, 'Security & Privacy', SecurityPrivacy()),
                  _buildScreenTile(context, 'Notification Settings', NotificationSettings()),
                  _buildScreenTile(context, 'Dashboard Config', DashboardConfig()),
                  _buildScreenTile(context, 'Profile Edit', ProfileEditScreen()),
                  _buildScreenTile(context, 'Offline Sync', OfflineSync()),
                ],
              ),
              
              // Development & Testing
              _buildCategory(
                context,
                'Development & Testing',
                Icons.developer_mode,
                Colors.amber,
                [
                  _buildScreenTile(context, 'Success Dialogs Demo', SuccessDialogsDemo()),
                ],
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.explore,
            size: 48,
            color: Color(0xFF1E3A8A),
          ),
          const SizedBox(height: 16),
          Text(
            'Screen Navigator',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Access all screens in the SafeReport app',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    List<Widget> screens,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const Spacer(),
                Text(
                  '${screens.length}',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          
          // Screens List
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: screens,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenTile(BuildContext context, String title, Widget screen) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
