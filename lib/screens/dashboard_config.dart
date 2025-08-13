import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardConfig extends StatefulWidget {
  const DashboardConfig({super.key});

  @override
  State<DashboardConfig> createState() => _DashboardConfigState();
}

class _DashboardConfigState extends State<DashboardConfig> {
  bool activeCases = true;
  bool mapView = true;
  bool quickStats = true;
  bool watchGroups = false;
  bool highPriorityAlerts = true;
  bool watchGroupAlerts = true;
  bool soundNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Widget Configuration
                    _buildWidgetConfiguration(),
                    const SizedBox(height: 16),
                    
                    // Alert Preferences
                    _buildAlertPreferences(),
                    const SizedBox(height: 16),
                    
                    // Quick Actions
                    _buildQuickActions(),
                    const SizedBox(height: 16),
                    
                    // Action Buttons
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0xFF1E3A8A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Officer Dashboard',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Customize your command center',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetConfiguration() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.grid_on,
                color: Color(0xFF1E3A8A),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Widget Configuration',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Arrange your dashboard widgets.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          
          _buildToggleRow('Active cases', activeCases, (value) {
            setState(() {
              activeCases = value;
            });
          }),
          const SizedBox(height: 16),
          
          _buildToggleRow('Map View', mapView, (value) {
            setState(() {
              mapView = value;
            });
          }),
          const SizedBox(height: 16),
          
          _buildToggleRow('Quick Stats', quickStats, (value) {
            setState(() {
              quickStats = value;
            });
          }),
          const SizedBox(height: 16),
          
          _buildToggleRow('Watch Groups', watchGroups, (value) {
            setState(() {
              watchGroups = value;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildAlertPreferences() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.notifications,
                color: Color(0xFF1E3A8A),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Alert Preferences',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          _buildToggleRowWithDescription(
            'High Priority Alerts',
            'Immediate notifications for urgent cases.',
            highPriorityAlerts,
            (value) {
              setState(() {
                highPriorityAlerts = value;
              });
            },
          ),
          const SizedBox(height: 16),
          
          _buildToggleRowWithDescription(
            'Watch Group Alerts',
            'Updates from assigned watch groups.',
            watchGroupAlerts,
            (value) {
              setState(() {
                watchGroupAlerts = value;
              });
            },
          ),
          const SizedBox(height: 16),
          
          _buildToggleRowWithDescription(
            'Sound Notifications',
            'Audio alerts for new cases.',
            soundNotifications,
            (value) {
              setState(() {
                soundNotifications = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.flash_on,
                color: Color(0xFF1E3A8A),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Quick Actions',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          Row(
            children: [
              Expanded(
                child: _buildActionButton('Active cases', true),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton('Map View', false),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildActionButton('Reports', false),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton('Messages', false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF1E3A8A),
        ),
      ],
    );
  }

  Widget _buildToggleRowWithDescription(String label, String description, bool value, ValueChanged<bool> onChanged) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF1E3A8A),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, bool isActive) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1E3A8A) : Colors.white,
        border: Border.all(
          color: const Color(0xFF1E3A8A),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : const Color(0xFF1E3A8A),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF1E3A8A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Save Configuration',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFF1E3A8A),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Reset to Default',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E3A8A),
              ),
            ),
          ),
        ),
      ],
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
          _buildNavItem(Icons.settings, 'Setup', true),
          _buildNavItem(Icons.diamond, 'Cases', false),
          _buildNavItem(Icons.home, 'Home', false),
          _buildNavItem(Icons.location_on, 'Map', false),
          _buildNavItem(Icons.chat_bubble, 'Comms', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
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
          style: GoogleFonts.inter(
            fontSize: 12,
            color: isActive ? const Color(0xFF1E3A8A) : Colors.grey[600],
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
} 