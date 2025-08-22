import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResolvedCases extends StatefulWidget {
  const ResolvedCases({super.key});

  @override
  State<ResolvedCases> createState() => _ResolvedCasesState();
}

class _ResolvedCasesState extends State<ResolvedCases> {
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
            
            // Dispatch Communications & Statistics
            _buildDispatchAndStats(),
            
            // Filter Buttons
            _buildFilterButtons(),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Case List
                    _buildCaseList(),
                    const SizedBox(height: 16),
                    
                    // Resolution Statistics
                    _buildResolutionStatistics(),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resolved Cases',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Closed incidents archive',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDispatchAndStats() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Dispatch Communications
          Row(
            children: [
              Icon(
                Icons.cell_tower,
                color: const Color(0xFF1E3A8A),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Dispatch Communications',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E3A8A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Statistics Grid
          Row(
            children: [
              Expanded(
                child: _buildStatCard('157', 'Total Resolved'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard('8.5m', 'Avg Resolution'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard('23', 'This Week'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard('94%', 'Success Rate'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // First row of filters
          Row(
            children: [
              Expanded(
                child: _buildFilterButton('All', selectedFilter == 'All', () {
                  setState(() {
                    selectedFilter = 'All';
                  });
                }),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildFilterButton('This Week', selectedFilter == 'This Week', () {
                  setState(() {
                    selectedFilter = 'This Week';
                  });
                }),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildFilterButton('My Cases', selectedFilter == 'My Cases', () {
                  setState(() {
                    selectedFilter = 'My Cases';
                  });
                }),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Second row - single High Priority button
          _buildFilterButton('High Priority', selectedFilter == 'High Priority', () {
            setState(() {
              selectedFilter = 'High Priority';
            });
          }),
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
            color: isSelected ? const Color(0xFF8B5CF6) : const Color(0xFF8B5CF6),
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
              color: isSelected ? Colors.white : const Color(0xFF8B5CF6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCaseList() {
    return Column(
      children: [
        // Case 1
        _buildResolvedCaseCard(
          '#SP-2025-0001',
          'Suspicious Person - School Area',
          '123 Main Street',
          'Resolved in 15 minutes',
          'Individual was identified as parent waiting for child. Legitimate activity confirmed.',
          'Officer Martinez',
          'Today 3:45 PM',
          'View Report',
          true,
        ),
        const SizedBox(height: 12),
        
        // Case 2
        _buildResolvedCaseCard(
          '#VA-2025-0002',
          'Vehicle Activity - Residential',
          'Oak Street',
          'Resolved in 45 minutes',
          'Vehicle belonged to delivery service. Driver was having GPS issues causing multiple circles.',
          'Officer Johnson',
          'Today 1:20 PM',
          'View Report',
          true,
        ),
        const SizedBox(height: 12),
        
        // Case 3
        _buildResolvedCaseCard(
          '#AP-2025-0003',
          'Abandoned Package - Park',
          'City Park',
          'Resolved in 2 hours',
          'Package contained sports equipment left by soccer team. Owner contacted and retrieved items.',
          'Officer Davis',
          'Yesterday 4:15 PM',
          'View Report',
          true,
        ),
        const SizedBox(height: 12),
        
        // Case 4
        _buildResolvedCaseCard(
          '#PI-2025-0004',
          'Property Incident - Vandalism',
          'Business District',
          'Investigated over 3 days',
          'Suspect identified through security footage. Citation issued and restitution arranged.',
          'Detective Smith',
          '2 days ago',
          'Full Report',
          false,
        ),
      ],
    );
  }

  Widget _buildResolvedCaseCard(
    String id,
    String title,
    String location,
    String time,
    String resolution,
    String resolvedBy,
    String resolvedTime,
    String buttonText,
    bool isResolved,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Expanded(
                child: Text(
                  id,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isResolved ? 'RESOLVED' : 'INVESTIGATION COMPLETE',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Title with checkmark
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              if (isResolved)
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
            ],
          ),
          const SizedBox(height: 12),
          
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
          
          // Resolution
          Text(
            'Resolution: $resolution',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          
          // Resolved By
          Text(
            'Resolved by: $resolvedBy • $resolvedTime',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          
          // Action Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: buttonText == 'Full Report' ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  buttonText,
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

  Widget _buildResolutionStatistics() {
    return Container(
      padding: const EdgeInsets.all(20.0),
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
          Row(
            children: [
              const Icon(
                Icons.bar_chart,
                color: Color(0xFF1E3A8A),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Resolution Statistics',
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
                child: _buildResolutionStatCard('85%', 'False Alarms', Colors.green),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildResolutionStatCard('12%', 'Citations', Colors.orange),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildResolutionStatCard('3%', 'Arrests', Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResolutionStatCard(String percentage, String label, Color color) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            percentage,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  
} 