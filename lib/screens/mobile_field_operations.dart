import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileFieldOperations extends StatefulWidget {
  const MobileFieldOperations({super.key});

  @override
  State<MobileFieldOperations> createState() => _MobileFieldOperationsState();
}

class _MobileFieldOperationsState extends State<MobileFieldOperations> {
  int selectedTab = 0;
  bool isOnline = true;
  bool isRecording = false;
  
  List<FieldReport> fieldReports = [
    FieldReport(
      id: 'FR-2025-001',
      type: 'Traffic Stop',
      location: 'Highway 95 - Mile Marker 23',
      description: 'Vehicle pulled over for speeding. Driver appeared intoxicated.',
      time: '2 hours ago',
      status: 'Draft',
      officer: 'Officer Martinez',
      coordinates: '40.7128° N, 74.0060° W',
      evidence: ['Photo_001.jpg', 'Video_001.mp4', 'Audio_001.mp3'],
      notes: 'Driver refused breathalyzer. Vehicle impounded.',
      syncStatus: 'Pending',
    ),
    FieldReport(
      id: 'FR-2025-002',
      type: 'Domestic Disturbance',
      location: '123 Oak Street, Apartment 4B',
      description: 'Responded to domestic disturbance call. Both parties present.',
      time: '4 hours ago',
      status: 'Submitted',
      officer: 'Officer Johnson',
      coordinates: '40.7130° N, 74.0062° W',
      evidence: ['Photo_002.jpg', 'Audio_002.mp3'],
      notes: 'No injuries reported. Warning issued to both parties.',
      syncStatus: 'Synced',
    ),
    FieldReport(
      id: 'FR-2025-003',
      type: 'Suspicious Activity',
      location: 'Downtown Plaza - Near Fountain',
      description: 'Observed suspicious behavior near main fountain.',
      time: '6 hours ago',
      status: 'Draft',
      officer: 'Officer Smith',
      coordinates: '40.7140° N, 74.0065° W',
      evidence: ['Photo_003.jpg', 'Video_003.mp4'],
      notes: 'Subject appeared to be conducting surveillance.',
      syncStatus: 'Pending',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Field Operations',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isOnline ? Icons.wifi : Icons.wifi_off),
            onPressed: () {
              setState(() {
                isOnline = !isOnline;
              });
            },
            tooltip: isOnline ? 'Online' : 'Offline',
          ),
        ],
      ),
      body: Column(
        children: [
          // Field Status Bar
          _buildFieldStatusBar(),
          
          // Tab Navigation
          _buildTabNavigation(),
          
          // Content based on selected tab
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _createNewFieldReport(context);
        },
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('New Report'),
      ),
    );
  }

  Widget _buildFieldStatusBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOnline ? Colors.green : Colors.orange,
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
            isOnline ? Icons.wifi : Icons.wifi_off,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            isOnline ? 'FIELD OPERATIONS ONLINE' : 'OFFLINE MODE - REPORTS QUEUED',
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
                isOnline ? 'Real-time Sync' : 'Offline Queue: ${fieldReports.where((r) => r.syncStatus == 'Pending').length}',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'GPS: Active',
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
    final tabs = ['Field Reports', 'Evidence Capture', 'Body Camera', 'Offline Queue'];
    
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
        return _buildFieldReportsTab();
      case 1:
        return _buildEvidenceCaptureTab();
      case 2:
        return _buildBodyCameraTab();
      case 3:
        return _buildOfflineQueueTab();
      default:
        return _buildFieldReportsTab();
    }
  }

  Widget _buildFieldReportsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: fieldReports.length,
      itemBuilder: (context, index) {
        final report = fieldReports[index];
        return _buildFieldReportCard(report);
      },
    );
  }

  Widget _buildFieldReportCard(FieldReport report) {
    Color statusColor = _getStatusColor(report.status);
    Color syncColor = _getSyncColor(report.syncStatus);
    
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
          // Header with Status and Sync
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
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
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    report.status,
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
                    color: syncColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    report.syncStatus,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  report.time,
                  style: GoogleFonts.inter(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Report Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        report.type,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      report.id,
                      style: GoogleFonts.inter(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  report.description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Location and Officer
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        report.location,
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
                        report.officer,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Evidence
                if (report.evidence.isNotEmpty) ...[
                  Text(
                    'Evidence:',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: report.evidence.map((evidence) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green[300]!),
                        ),
                        child: Text(
                          evidence,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: Colors.green[800],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
                
                // Notes
                if (report.notes.isNotEmpty) ...[
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
                          'Officer Notes:',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange[800],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          report.notes,
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
                        onPressed: () => _editReport(report),
                        icon: const Icon(Icons.edit, size: 16),
                        label: const Text('Edit'),
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
                        onPressed: () => _viewReport(report),
                        icon: const Icon(Icons.visibility, size: 16),
                        label: const Text('View'),
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

  Widget _buildEvidenceCaptureTab() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evidence Capture',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // Capture Options
          _buildCaptureOption('Photo Capture', Icons.camera_alt, Colors.blue, 'Take photos of evidence, scene, or subjects'),
          _buildCaptureOption('Video Recording', Icons.videocam, Colors.red, 'Record video evidence and statements'),
          _buildCaptureOption('Audio Recording', Icons.mic, Colors.green, 'Record audio statements and interviews'),
          _buildCaptureOption('Document Scan', Icons.document_scanner, Colors.orange, 'Scan documents and forms'),
          _buildCaptureOption('GPS Location', Icons.location_on, Colors.purple, 'Capture precise location coordinates'),
        ],
      ),
    );
  }

  Widget _buildCaptureOption(String title, IconData icon, Color color, String description) {
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
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _startCapture(title),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyCameraTab() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Body Camera Control',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // Camera Status
          Container(
            padding: const EdgeInsets.all(20),
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
                Icon(
                  isRecording ? Icons.videocam : Icons.videocam_off,
                  size: 64,
                  color: isRecording ? Colors.red : Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  isRecording ? 'RECORDING ACTIVE' : 'CAMERA READY',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isRecording ? Colors.red : Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isRecording ? 'Recording in progress...' : 'Camera is ready to record',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Camera Controls
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _toggleRecording(),
                        icon: Icon(isRecording ? Icons.stop : Icons.fiber_manual_record),
                        label: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isRecording ? Colors.red : Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Camera Settings
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showCameraSettings(),
                        icon: const Icon(Icons.settings),
                        label: const Text('Settings'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF1E3A8A),
                          side: const BorderSide(color: Color(0xFF1E3A8A)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _viewRecordings(),
                        icon: const Icon(Icons.photo_library),
                        label: const Text('View Files'),
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

  Widget _buildOfflineQueueTab() {
    List<FieldReport> offlineReports = fieldReports.where((r) => r.syncStatus == 'Pending').toList();
    
    if (offlineReports.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_done,
              size: 64,
              color: Colors.green[400],
            ),
            const SizedBox(height: 16),
            Text(
              'All reports synced!',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.green[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No pending reports in offline queue',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Sync Status Header
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange[300]!),
          ),
          child: Row(
            children: [
              Icon(Icons.cloud_off, color: Colors.orange[700], size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Offline Queue',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange[800],
                      ),
                    ),
                    Text(
                      '${offlineReports.length} reports waiting to sync',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.orange[700],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _syncReports(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Sync Now'),
              ),
            ],
          ),
        ),
        
        // Offline Reports List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: offlineReports.length,
            itemBuilder: (context, index) {
              return _buildOfflineReportCard(offlineReports[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOfflineReportCard(FieldReport report) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange[300]!),
      ),
      child: Row(
        children: [
          Icon(Icons.cloud_off, color: Colors.orange, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report.type,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  report.location,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Created: ${report.time}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _retrySync(report),
            icon: const Icon(Icons.sync),
            color: Colors.orange,
            tooltip: 'Retry Sync',
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Draft':
        return Colors.orange;
      case 'Submitted':
        return Colors.green;
      case 'Under Review':
        return Colors.blue;
      case 'Approved':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getSyncColor(String syncStatus) {
    switch (syncStatus) {
      case 'Synced':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _editReport(FieldReport report) {
    // TODO: Implement report editing
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Editing ${report.id}'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _viewReport(FieldReport report) {
    // TODO: Navigate to report details
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing ${report.id}'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
    );
  }

  void _startCapture(String type) {
    // TODO: Implement evidence capture
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Starting $type'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isRecording ? 'Recording started' : 'Recording stopped'),
        backgroundColor: isRecording ? Colors.red : Colors.green,
      ),
    );
  }

  void _showCameraSettings() {
    // TODO: Show camera settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Camera settings coming soon'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
    );
  }

  void _viewRecordings() {
    // TODO: Navigate to recordings view
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Recordings view coming soon'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
    );
  }

  void _syncReports() {
    // TODO: Implement report synchronization
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Syncing reports...'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _retrySync(FieldReport report) {
    // TODO: Implement retry sync for specific report
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Retrying sync for ${report.id}'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _createNewFieldReport(BuildContext context) {
    // TODO: Navigate to new report creation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New report creation coming soon'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
    );
  }
}

class FieldReport {
  final String id;
  final String type;
  final String location;
  final String description;
  final String time;
  final String status;
  final String officer;
  final String coordinates;
  final List<String> evidence;
  final String notes;
  final String syncStatus;

  FieldReport({
    required this.id,
    required this.type,
    required this.location,
    required this.description,
    required this.time,
    required this.status,
    required this.officer,
    required this.coordinates,
    required this.evidence,
    required this.notes,
    required this.syncStatus,
  });
}
