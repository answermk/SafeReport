import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCases extends StatefulWidget {
  const AllCases({super.key});

  @override
  State<AllCases> createState() => _AllCasesState();
}

class _AllCasesState extends State<AllCases> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Filter Buttons
            _buildFilterButtons(),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Case Cards
                    _buildCaseCards(),
                    const SizedBox(height: 16),
                    
                    // Load More Section
                    _buildLoadMoreSection(),
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
            'All cases',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Complete case overview',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildFilterButton('All(47)', selectedFilter == 'All', () {
              setState(() {
                selectedFilter = 'All';
              });
            }),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildFilterButton('Active(12)', selectedFilter == 'Active', () {
              setState(() {
                selectedFilter = 'Active';
              });
            }),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildFilterButton('Mine(5)', selectedFilter == 'Mine', () {
              setState(() {
                selectedFilter = 'Mine';
              });
            }),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B5CF6) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF8B5CF6) : Colors.grey[300]!,
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
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCaseCards() {
    return Column(
      children: [
        // Case 1 - URGENT
        _buildCaseCard(
          caseId: '#SP-2025-0001',
          priority: 'URGENT',
          status: 'Active',
          type: 'Suspicious Person - School Area',
          location: '123 Main Street',
          time: '2 hours ago',
          description: 'Individual loitering around school entrance during dismissal time...',
          assignment: 'Assigned to: You',
          actionButton: 'Respond',
          actionButtonColor: Colors.red,
          priorityColor: Colors.blue,
          statusColor: Colors.black,
          typeColor: Colors.red,
        ),
        const SizedBox(height: 12),
        
        // Case 2 - MEDIUM
        _buildCaseCard(
          caseId: '#VA-2025-0002',
          priority: 'MEDIUM',
          status: 'INVESTIGATING',
          type: 'Vehicle Activity - Residential',
          location: 'Oak Street',
          time: '2 hours ago',
          description: 'Vehicle circling neighborhood multiple times....',
          assignment: 'Assigned to: Officer Johnson',
          actionButton: 'View',
          actionButtonColor: Colors.blue,
          priorityColor: Colors.blue,
          statusColor: Colors.green,
          typeColor: Colors.green,
        ),
        const SizedBox(height: 12),
        
        // Case 3 - LOW
        _buildCaseCard(
          caseId: '#AP-2025-0003',
          priority: 'LOW',
          status: 'RESOLVED',
          type: 'Abandoned Package - Park',
          location: 'City Park',
          time: 'Yesterday',
          description: 'Suspicious backpack left unattended...',
          assignment: 'Resolved by: Officer Martinez',
          actionButton: 'Details',
          actionButtonColor: Colors.green,
          priorityColor: Colors.blue,
          statusColor: Colors.green,
          typeColor: Colors.green,
        ),
        const SizedBox(height: 12),
        
        // Case 4 - HIGH
        _buildCaseCard(
          caseId: '#DA-2025-0004',
          priority: 'HIGH',
          status: 'Active',
          type: 'Drug Activity - Business District',
          location: 'Downtown Plaza',
          time: '2 hours ago',
          description: 'Suspected drug transaction observed.....',
          assignment: 'Unassigned',
          actionButton: 'Take Case',
          actionButtonColor: Colors.blue,
          priorityColor: Colors.blue,
          statusColor: Colors.black,
          typeColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildCaseCard({
    required String caseId,
    required String priority,
    required String status,
    required String type,
    required String location,
    required String time,
    required String description,
    required String assignment,
    required String actionButton,
    required Color actionButtonColor,
    required Color priorityColor,
    required Color statusColor,
    required Color typeColor,
  }) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Expanded(
                child: Text(
                  caseId,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: priorityColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  priority,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Status Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: status == 'RESOLVED' || status == 'INVESTIGATING' 
                      ? Colors.green[100] 
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: status == 'RESOLVED' || status == 'INVESTIGATING' 
                        ? Colors.green 
                        : Colors.grey,
                    width: 1,
                  ),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Type
          Text(
            type,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: typeColor,
            ),
          ),
          const SizedBox(height: 8),
          
          // Location and Time
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Colors.red[600],
              ),
              const SizedBox(width: 4),
              Text(
                location,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.access_time,
                size: 16,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 4),
              Text(
                time,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Description
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[700],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          
          // Assignment and Action Button
          Row(
            children: [
              Expanded(
                child: Text(
                  assignment,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: actionButtonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  actionButton,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Showing 4 of 47 cases',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFF8B5CF6),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Load More',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF8B5CF6),
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
          _buildNavItem(Icons.settings, 'Setup', false),
          _buildNavItem(Icons.diamond, 'Cases', true),
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