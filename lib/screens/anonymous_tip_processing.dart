import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnonymousTipProcessing extends StatefulWidget {
  const AnonymousTipProcessing({super.key});

  @override
  State<AnonymousTipProcessing> createState() => _AnonymousTipProcessingState();
}

class _AnonymousTipProcessingState extends State<AnonymousTipProcessing> {
  int selectedTab = 0;
  String selectedPriority = 'All';
  String selectedStatus = 'All';
  
  final List<String> priorities = ['All', 'Critical', 'High', 'Medium', 'Low'];
  final List<String> statuses = ['All', 'New', 'Under Review', 'Verified', 'Actioned', 'Closed'];

  List<AnonymousTip> anonymousTips = [
    AnonymousTip(
      id: 'TIP-2025-001',
      category: 'Drug Activity',
      priority: 'High',
      location: 'Central Park - Near Fountain',
      description: 'Suspicious drug dealing activity observed near the main fountain. Multiple people involved, appears to be organized.',
      time: '2 hours ago',
      status: 'New',
      riskLevel: 'High',
      coordinates: '40.7128° N, 74.0060° W',
      additionalInfo: 'Suspects appear to be using code words. Activity peaks between 8-11 PM.',
      source: 'Anonymous',
      verificationLevel: 'Unverified',
    ),
    AnonymousTip(
      id: 'TIP-2025-002',
      category: 'Vehicle Theft',
      priority: 'Critical',
      location: 'Residential Area - Oak Street',
      description: 'Suspicious person checking car doors in residential area. Matches description of known vehicle theft suspect.',
      time: '4 hours ago',
      status: 'Under Review',
      riskLevel: 'Critical',
      coordinates: '40.7130° N, 74.0062° W',
      additionalInfo: 'Suspect wearing black hoodie, driving white van. License plate partially visible: ABC-1**',
      source: 'Anonymous',
      verificationLevel: 'Partially Verified',
    ),
    AnonymousTip(
      id: 'TIP-2025-003',
      category: 'Domestic Violence',
      priority: 'High',
      location: 'Apartment Complex - 123 Main St',
      description: 'Loud arguments and possible physical altercation heard from apartment 4B. Sounds of objects being thrown.',
      time: '6 hours ago',
      status: 'Verified',
      riskLevel: 'High',
      coordinates: '40.7140° N, 74.0065° W',
      additionalInfo: 'Arguments occur almost daily. Female voice often crying. Children may be present.',
      source: 'Anonymous',
      verificationLevel: 'Verified',
    ),
    AnonymousTip(
      id: 'TIP-2025-004',
      category: 'Gang Activity',
      priority: 'Medium',
      location: 'Downtown - Alley behind Bank',
      description: 'Group of young people gathering in alley, possible gang activity. Graffiti with gang symbols appearing.',
      time: '1 day ago',
      status: 'Actioned',
      riskLevel: 'Medium',
      coordinates: '40.7150° N, 74.0068° W',
      additionalInfo: 'Group meets every Friday evening. Some members appear to be minors.',
      source: 'Anonymous',
      verificationLevel: 'Verified',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Anonymous Tips',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.security),
            onPressed: () {
              _showSecurityInfo();
            },
            tooltip: 'Security Info',
          ),
        ],
      ),
      body: Column(
        children: [
          // Security Status Bar
          _buildSecurityStatusBar(),
          
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

  Widget _buildSecurityStatusBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
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
            Icons.verified_user,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            'ANONYMOUS TIP SYSTEM SECURE',
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
                'End-to-End Encrypted',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'No IP Tracking',
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
    final tabs = ['All Tips', 'New Tips', 'Under Review', 'Verified', 'Actioned'];
    
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
        return _buildAllTipsTab();
      case 1:
        return _buildNewTipsTab();
      case 2:
        return _buildUnderReviewTab();
      case 3:
        return _buildVerifiedTab();
      case 4:
        return _buildActionedTab();
      default:
        return _buildAllTipsTab();
    }
  }

  Widget _buildAllTipsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Filters
          _buildTipFilters(),
          const SizedBox(height: 16),
          
          // Tips List
          ...anonymousTips.map((tip) => _buildTipCard(tip)).toList(),
        ],
      ),
    );
  }

  Widget _buildNewTipsTab() {
    List<AnonymousTip> newTips = anonymousTips.where((tip) => tip.status == 'New').toList();
    return _buildTipsList(newTips);
  }

  Widget _buildUnderReviewTab() {
    List<AnonymousTip> underReviewTips = anonymousTips.where((tip) => tip.status == 'Under Review').toList();
    return _buildTipsList(underReviewTips);
  }

  Widget _buildVerifiedTab() {
    List<AnonymousTip> verifiedTips = anonymousTips.where((tip) => tip.status == 'Verified').toList();
    return _buildTipsList(verifiedTips);
  }

  Widget _buildActionedTab() {
    List<AnonymousTip> actionedTips = anonymousTips.where((tip) => tip.status == 'Actioned').toList();
    return _buildTipsList(actionedTips);
  }

  Widget _buildTipsList(List<AnonymousTip> tips) {
    if (tips.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No tips in this category',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return _buildTipCard(tips[index]);
      },
    );
  }

  Widget _buildTipFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter Tips',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Priority:',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedPriority,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: priorities.map((priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: Text(priority),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedPriority = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status:',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedStatus,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: statuses.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value!;
                        });
                      },
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

  Widget _buildTipCard(AnonymousTip tip) {
    Color priorityColor = _getPriorityColor(tip.priority);
    Color statusColor = _getStatusColor(tip.status);
    Color riskColor = _getRiskColor(tip.riskLevel);
    
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
          // Header with Priority, Status, and Risk
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
                    tip.priority,
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
                    tip.status,
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
                    color: riskColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tip.riskLevel,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  tip.time,
                  style: GoogleFonts.inter(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Tip Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        tip.category,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      tip.id,
                      style: GoogleFonts.inter(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  tip.description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Location and Verification
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tip.location,
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
                        tip.verificationLevel,
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
                      'Source: ${tip.source}',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Additional Information
                if (tip.additionalInfo.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Additional Information:',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange[800],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tip.additionalInfo,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.orange[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _updateTipStatus(tip),
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
                        onPressed: () => _viewTipDetails(tip),
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
      case 'New':
        return Colors.blue;
      case 'Under Review':
        return Colors.orange;
      case 'Verified':
        return Colors.green;
      case 'Actioned':
        return Colors.purple;
      case 'Closed':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Color _getRiskColor(String risk) {
    switch (risk) {
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

  void _updateTipStatus(AnonymousTip tip) {
    // TODO: Implement tip status update logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Status updated for ${tip.id}'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _viewTipDetails(AnonymousTip tip) {
    // TODO: Navigate to tip details page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing details for ${tip.id}'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
    );
  }

  void _showSecurityInfo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Security Information'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• End-to-end encryption for all communications'),
              SizedBox(height: 8),
              Text('• No IP address tracking or logging'),
              SizedBox(height: 8),
              Text('• Anonymous submission with no personal data required'),
              SizedBox(height: 8),
              Text('• Secure data transmission protocols'),
              SizedBox(height: 8),
              Text('• Regular security audits and updates'),
            ],
          ),
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

class AnonymousTip {
  final String id;
  final String category;
  final String priority;
  final String location;
  final String description;
  final String time;
  final String status;
  final String riskLevel;
  final String coordinates;
  final String additionalInfo;
  final String source;
  final String verificationLevel;

  AnonymousTip({
    required this.id,
    required this.category,
    required this.priority,
    required this.location,
    required this.description,
    required this.time,
    required this.status,
    required this.riskLevel,
    required this.coordinates,
    required this.additionalInfo,
    required this.source,
    required this.verificationLevel,
  });
}
