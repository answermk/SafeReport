import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveAlerts extends StatelessWidget {
  const LiveAlerts({super.key});

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
                    // Notification Cards Section
                    _buildNotificationCards(),
                    const SizedBox(height: 24),
                    
                    // System Update Section
                    _buildSystemUpdateSection(),
                    const SizedBox(height: 16),
                    
                    // Alert Settings Card
                    _buildAlertSettingsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Live Alerts',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Real-time notification center',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              // Alert Count
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.warning,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Active Alerts (5)',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Settings Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Color(0xFF1E3A8A),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Settings',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E3A8A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Urgent: New Case Assignment
        _buildNotificationCard(
          'URGENT: New Case Assignment',
          'Just now',
          Icons.warning,
          Colors.red,
          [
            'Case #SP-2025-0001 assigned to you',
            'Suspicious person at school - Immediate response required',
          ],
          [
            _buildActionButton('Respond', Colors.red, true),
            _buildActionButton('Decline', Colors.white, false),
          ],
        ),
        const SizedBox(height: 12),
        
        // Priority Update
        _buildNotificationCard(
          'Priority Update',
          '5 mins ago',
          Icons.flash_on,
          Colors.green,
          [
            'Case #VA-2025-0002 priority increased',
            'Additional reports received for same vehicle',
          ],
          null,
        ),
        const SizedBox(height: 12),
        
        // Watch Group Message
        _buildNotificationCard(
          'Watch Group Message',
          '15 mins ago',
          Icons.people,
          Colors.blue,
          [
            'Oak Street Watch Group',
            'Group leader requesting patrol presence for community event',
          ],
          null,
        ),
        const SizedBox(height: 12),
        
        // Case Resolved
        _buildNotificationCard(
          'Case Resolved',
          '30 mins ago',
          Icons.check_circle,
          Colors.green,
          [
            'Case #AP-2025-0003 closed',
            'Abandoned package was sports equipment - owner contacted',
          ],
          null,
        ),
      ],
    );
  }

  Widget _buildNotificationCard(
    String title,
    String timestamp,
    IconData icon,
    Color color,
    List<String> details,
    List<Widget>? actionButtons,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
      child: Row(
        children: [
          Container(
            width: 4,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        border: Border.all(color: Colors.purple[300]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        timestamp,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.purple[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...details.map((detail) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    detail,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: detail.contains('Immediate response required') || detail.contains('priority increased')
                          ? Colors.red
                          : Colors.grey[700],
                      fontWeight: detail.contains('Immediate response required') || detail.contains('priority increased')
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                )),
                if (actionButtons != null) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: actionButtons,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color backgroundColor, bool isPrimary) {
    return Expanded(
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: isPrimary ? null : Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isPrimary ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSystemUpdateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // System Update Card
        _buildSystemCard(
          Icons.bar_chart,
          'System Update',
          '1 hour ago',
          [
            'Daily statistics report',
            'available',
            'View your performance',
            'metrics and area insights',
          ],
        ),
        const SizedBox(height: 16),
        
        // Earlier Today Section
        Row(
          children: [
            Icon(
              Icons.assignment_turned_in,
              color: const Color(0xFF1E3A8A),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Earlier Today',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E3A8A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Shift Update Card
        _buildSystemCard(
          Icons.person,
          'Shift Update',
          '3 hours ago',
          [
            'Officer Johnson clocked in',
            'Downtown patrol coverage',
            'now at full capacity',
          ],
        ),
      ],
    );
  }

  Widget _buildSystemCard(
    IconData icon,
    String title,
    String timestamp,
    List<String> details,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
      child: Row(
        children: [
          Container(
            width: 4,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A8A),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A8A),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E3A8A),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        timestamp,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.pink[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...details.map((detail) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    detail,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertSettingsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications,
                color: Colors.amber[600],
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Alert Settings',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E3A8A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Customize your notification',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'preferences',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A8A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Manage Alerts',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
} 