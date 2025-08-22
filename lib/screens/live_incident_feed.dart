import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveIncidentFeed extends StatefulWidget {
  const LiveIncidentFeed({super.key});

  @override
  State<LiveIncidentFeed> createState() => _LiveIncidentFeedState();
}

class _LiveIncidentFeedState extends State<LiveIncidentFeed> {
  int selectedFilter = 0;
  bool isLive = true;
  List<Incident> incidents = [
    Incident(
      id: 'INC-2025-001',
      type: 'Suspicious Activity',
      priority: 'High',
      location: 'Downtown Plaza',
      description: 'Suspicious person loitering near school entrance',
      time: '2 minutes ago',
      status: 'Pending',
      reporter: 'Anonymous',
      coordinates: '40.7128° N, 74.0060° W',
      category: 'School Safety',
    ),
    Incident(
      id: 'INC-2025-002',
      type: 'Vehicle Theft',
      priority: 'Critical',
      location: 'Residential Area - Oak Street',
      description: 'Vehicle reported stolen, last seen 30 minutes ago',
      time: '5 minutes ago',
      status: 'In Progress',
      reporter: 'John Smith',
      coordinates: '40.7130° N, 74.0062° W',
      category: 'Property Crime',
    ),
    Incident(
      id: 'INC-2025-003',
      type: 'Drug Activity',
      priority: 'Medium',
      location: 'Park Area - Central Park',
      description: 'Suspicious drug-related activity observed',
      time: '8 minutes ago',
      status: 'Assigned',
      reporter: 'Anonymous',
      coordinates: '40.7140° N, 74.0065° W',
      category: 'Drug Crime',
    ),
    Incident(
      id: 'INC-2025-004',
      type: 'Vandalism',
      priority: 'Low',
      location: 'Business District - Main Street',
      description: 'Graffiti and property damage reported',
      time: '15 minutes ago',
      status: 'Resolved',
      reporter: 'Business Owner',
      coordinates: '40.7150° N, 74.0068° W',
      category: 'Property Crime',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Live Incident Feed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isLive ? Icons.radio_button_checked : Icons.radio_button_unchecked),
            onPressed: () {
              setState(() {
                isLive = !isLive;
              });
            },
            tooltip: isLive ? 'Live Mode Active' : 'Live Mode Inactive',
          ),
        ],
      ),
      body: Column(
        children: [
          // Live Status Bar
          _buildLiveStatusBar(),
          
          // Filter Tabs
          _buildFilterTabs(),
          
          // Incident List
          Expanded(
            child: _buildIncidentList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showNewIncidentDialog(context);
        },
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('New Incident'),
      ),
    );
  }

  Widget _buildLiveStatusBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLive ? Colors.green : Colors.grey,
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
            isLive ? Icons.radio_button_checked : Icons.radio_button_unchecked,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            isLive ? 'LIVE FEED ACTIVE' : 'LIVE FEED INACTIVE',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            '${incidents.length} Active Incidents',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    final filters = ['All', 'Critical', 'High', 'Medium', 'Low'];
    
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.asMap().entries.map((entry) {
            final index = entry.key;
            final filter = entry.value;
            final isSelected = selectedFilter == index;
            
            return Container(
              margin: const EdgeInsets.only(right: 12),
              child: FilterChip(
                label: Text(filter),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    selectedFilter = index;
                  });
                },
                backgroundColor: Colors.white,
                selectedColor: const Color(0xFF1E3A8A),
                labelStyle: GoogleFonts.inter(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                side: BorderSide(
                  color: isSelected ? const Color(0xFF1E3A8A) : Colors.grey[300]!,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildIncidentList() {
    List<Incident> filteredIncidents = incidents;
    
    if (selectedFilter > 0) {
      final priorities = ['', 'Critical', 'High', 'Medium', 'Low'];
      filteredIncidents = incidents.where((incident) => 
        incident.priority == priorities[selectedFilter]
      ).toList();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredIncidents.length,
      itemBuilder: (context, index) {
        final incident = filteredIncidents[index];
        return _buildIncidentCard(incident);
      },
    );
  }

  Widget _buildIncidentCard(Incident incident) {
    Color priorityColor = _getPriorityColor(incident.priority);
    Color statusColor = _getStatusColor(incident.status);
    
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
                    incident.priority,
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
                    incident.status,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  incident.time,
                  style: GoogleFonts.inter(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Incident Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        incident.type,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      incident.id,
                      style: GoogleFonts.inter(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  incident.description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Location and Category
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        incident.location,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        incident.category,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey[600], size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Reporter: ${incident.reporter}',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _assignIncident(incident),
                        icon: const Icon(Icons.assignment, size: 16),
                        label: const Text('Assign'),
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
                        onPressed: () => _viewDetails(incident),
                        icon: const Icon(Icons.visibility, size: 16),
                        label: const Text('View Details'),
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
      case 'Pending':
        return Colors.orange;
      case 'In Progress':
        return Colors.blue;
      case 'Assigned':
        return Colors.purple;
      case 'Resolved':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _assignIncident(Incident incident) {
    // TODO: Implement incident assignment logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Incident ${incident.id} assigned successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _viewDetails(Incident incident) {
    // TODO: Navigate to incident details page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing details for ${incident.id}'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
    );
  }

  void _showNewIncidentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Incident Report'),
          content: const Text('This feature will allow officers to create new incident reports.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Incident {
  final String id;
  final String type;
  final String priority;
  final String location;
  final String description;
  final String time;
  final String status;
  final String reporter;
  final String coordinates;
  final String category;

  Incident({
    required this.id,
    required this.type,
    required this.priority,
    required this.location,
    required this.description,
    required this.time,
    required this.status,
    required this.reporter,
    required this.coordinates,
    required this.category,
  });
}
