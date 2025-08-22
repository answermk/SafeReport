import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyResponseDashboard extends StatefulWidget {
  const EmergencyResponseDashboard({super.key});

  @override
  State<EmergencyResponseDashboard> createState() => _EmergencyResponseDashboardState();
}

class _EmergencyResponseDashboardState extends State<EmergencyResponseDashboard> {
  int selectedTab = 0;
  List<EmergencyCall> emergencyCalls = [
    EmergencyCall(
      id: 'EMG-2025-001',
      type: 'Armed Robbery',
      priority: 'Critical',
      location: 'Bank of Downtown - 123 Main St',
      description: 'Armed suspect reported inside bank, hostages possible',
      time: '1 minute ago',
      status: 'DISPATCHING',
      assignedOfficers: ['Officer Martinez', 'Officer Johnson'],
      responseTime: '2 min',
      coordinates: '40.7128° N, 74.0060° W',
      category: 'Violent Crime',
      units: ['SWAT', 'K9', 'Negotiator'],
    ),
    EmergencyCall(
      id: 'EMG-2025-002',
      type: 'Domestic Violence',
      priority: 'High',
      location: 'Residential - 456 Oak Ave',
      description: 'Domestic disturbance, weapons involved',
      time: '3 minutes ago',
      status: 'EN ROUTE',
      assignedOfficers: ['Officer Smith'],
      responseTime: '5 min',
      coordinates: '40.7130° N, 74.0062° W',
      category: 'Domestic Violence',
      units: ['Patrol', 'Backup'],
    ),
    EmergencyCall(
      id: 'EMG-2025-003',
      type: 'Traffic Accident',
      priority: 'Medium',
      location: 'Highway 95 - Mile Marker 23',
      description: 'Multi-vehicle collision, injuries reported',
      time: '8 minutes ago',
      status: 'ON SCENE',
      assignedOfficers: ['Officer Davis', 'Officer Wilson'],
      responseTime: '6 min',
      coordinates: '40.7140° N, 74.0065° W',
      category: 'Traffic',
      units: ['EMS', 'Fire', 'Traffic'],
    ),
    EmergencyCall(
      id: 'EMG-2025-004',
      type: 'Fire Alarm',
      priority: 'High',
      location: 'Shopping Mall - 789 Center Blvd',
      description: 'Fire alarm activation, smoke reported',
      time: '12 minutes ago',
      status: 'RESOLVED',
      assignedOfficers: ['Officer Brown'],
      responseTime: '4 min',
      coordinates: '40.7150° N, 74.0068° W',
      category: 'Fire',
      units: ['Fire', 'Patrol'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Emergency Response',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              _showNotifications();
            },
            tooltip: 'Notifications',
          ),
        ],
      ),
      body: Column(
        children: [
          // Emergency Status Bar
          _buildEmergencyStatusBar(),
          
          // Tab Navigation
          _buildTabNavigation(),
          
          // Content based on selected tab
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyStatusBar() {
    int criticalCalls = emergencyCalls.where((call) => call.priority == 'Critical').length;
    int activeCalls = emergencyCalls.where((call) => call.status != 'RESOLVED').length;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: criticalCalls > 0 ? Colors.red : const Color(0xFF1E3A8A),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            criticalCalls > 0 ? Icons.warning : Icons.security,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            criticalCalls > 0 ? 'CRITICAL EMERGENCY ACTIVE' : 'EMERGENCY RESPONSE READY',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$criticalCalls Critical',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$activeCalls Active Calls',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabNavigation() {
    final tabs = ['Active Calls', 'Officer Status', 'Response Times', 'Resources'];
    
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = selectedTab == index;
          
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF1E3A8A) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF1E3A8A) : Colors.grey[300]!,
                  ),
                ),
                child: Text(
                  tab,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return _buildActiveCallsTab();
      case 1:
        return _buildOfficerStatusTab();
      case 2:
        return _buildResponseTimesTab();
      case 3:
        return _buildResourcesTab();
      default:
        return _buildActiveCallsTab();
    }
  }

  Widget _buildActiveCallsTab() {
    List<EmergencyCall> activeCalls = emergencyCalls.where((call) => call.status != 'RESOLVED').toList();
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: activeCalls.length,
      itemBuilder: (context, index) {
        final call = activeCalls[index];
        return _buildEmergencyCallCard(call);
      },
    );
  }

  Widget _buildEmergencyCallCard(EmergencyCall call) {
    Color priorityColor = _getPriorityColor(call.priority);
    Color statusColor = _getStatusColor(call.status);
    
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
        children: [
          // Header with Priority and Status
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: priorityColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: priorityColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    call.priority,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    call.status,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  call.time,
                  style: GoogleFonts.inter(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Call Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        call.type,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      call.id,
                      style: GoogleFonts.inter(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  call.description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Location and Response Time
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        call.location,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Response: ${call.responseTime}',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.green[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Assigned Officers
                Text(
                  'Assigned Officers:',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: call.assignedOfficers.map((officer) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A8A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        officer,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                
                // Units Required
                Text(
                  'Units Required:',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: call.units.map((unit) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange[300]!),
                      ),
                      child: Text(
                        unit,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: Colors.orange[800],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _updateStatus(call),
                        icon: const Icon(Icons.update, size: 16),
                        label: const Text('Update Status'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _addOfficer(call),
                        icon: const Icon(Icons.person_add, size: 16),
                        label: const Text('Add Officer'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF1E3A8A),
                          side: const BorderSide(color: Color(0xFF1E3A8A)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfficerStatusTab() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Officer Status Overview',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildOfficerStatusCard('Officer Martinez', 'Available', Colors.green, 'Patrol Unit A'),
          _buildOfficerStatusCard('Officer Johnson', 'On Call', Colors.orange, 'SWAT Team'),
          _buildOfficerStatusCard('Officer Smith', 'Responding', Colors.blue, 'Patrol Unit B'),
          _buildOfficerStatusCard('Officer Davis', 'On Scene', Colors.purple, 'Traffic Unit'),
          _buildOfficerStatusCard('Officer Wilson', 'Available', Colors.green, 'Patrol Unit C'),
          _buildOfficerStatusCard('Officer Brown', 'Off Duty', Colors.grey, 'Patrol Unit A'),
        ],
      ),
    );
  }

  Widget _buildOfficerStatusCard(String name, String status, Color color, String unit) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  unit,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponseTimesTab() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Response Time Analytics',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildResponseTimeCard('Average Response Time', '4.2 min', Colors.blue),
          _buildResponseTimeCard('Critical Calls', '2.1 min', Colors.red),
          _buildResponseTimeCard('High Priority', '3.8 min', Colors.orange),
          _buildResponseTimeCard('Medium Priority', '5.5 min', Colors.yellow[700]!),
          _buildResponseTimeCard('Low Priority', '7.2 min', Colors.green),
        ],
      ),
    );
  }

  Widget _buildResponseTimeCard(String label, String time, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourcesTab() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Resources',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildResourceCard('Patrol Units', '8 Available', Colors.green),
          _buildResourceCard('SWAT Team', '2 Available', Colors.blue),
          _buildResourceCard('K9 Units', '3 Available', Colors.orange),
          _buildResourceCard('Traffic Units', '4 Available', Colors.purple),
          _buildResourceCard('Negotiators', '1 Available', Colors.red),
        ],
      ),
    );
  }

  Widget _buildResourceCard(String resource, String status, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              resource,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Critical':
        return Colors.red;
      case 'High':
        return Colors.orange;
      case 'Medium':
        return Colors.yellow[700]!;
      case 'Low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'DISPATCHING':
        return Colors.red;
      case 'EN ROUTE':
        return Colors.orange;
      case 'ON SCENE':
        return Colors.blue;
      case 'RESOLVED':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _updateStatus(EmergencyCall call) {
    // TODO: Implement status update logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Status updated for ${call.id}'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _addOfficer(EmergencyCall call) {
    // TODO: Implement officer assignment logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Officer added to ${call.id}'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showNotifications() {
    // TODO: Implement notifications view
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notifications feature coming soon'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
    );
  }
}

class EmergencyCall {
  final String id;
  final String type;
  final String priority;
  final String location;
  final String description;
  final String time;
  final String status;
  final List<String> assignedOfficers;
  final String responseTime;
  final String coordinates;
  final String category;
  final List<String> units;

  EmergencyCall({
    required this.id,
    required this.type,
    required this.priority,
    required this.location,
    required this.description,
    required this.time,
    required this.status,
    required this.assignedOfficers,
    required this.responseTime,
    required this.coordinates,
    required this.category,
    required this.units,
  });
}
