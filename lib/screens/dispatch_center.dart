import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DispatchCenter extends StatelessWidget {
  const DispatchCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _filters(),
            Expanded(child: _assignmentsList()),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
          Text('Dispatch Center', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Assignments and acknowledgments', style: GoogleFonts.inter(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _filters() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _chip('All', true),
          const SizedBox(width: 12),
          _chip('Unacknowledged', false),
          const SizedBox(width: 12),
          _chip('Acknowledged', false),
          const Spacer(),
          _iconButton(Icons.search),
        ],
      ),
    );
  }

  Widget _chip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF8B5CF6) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: selected ? const Color(0xFF8B5CF6) : Colors.grey[300]!),
      ),
      child: Text(label, style: GoogleFonts.inter(color: selected ? Colors.white : Colors.grey[800], fontWeight: FontWeight.w600)),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
      child: Icon(icon, color: Colors.grey[700]),
    );
  }

  Widget _assignmentsList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _assignmentCard('SP-2025-0007', 'Suspicious Person', 'School Area', 'High', 'Oak St - Gate 3', 'Now'),
          const SizedBox(height: 12),
          _assignmentCard('VA-2025-0012', 'Vehicle Activity', 'Residential', 'Medium', 'Elm Ave - 400 block', '3m'),
          const SizedBox(height: 12),
          _assignmentCard('DA-2025-0041', 'Drug Activity', 'Business District', 'High', 'Downtown Plaza', '12m'),
        ],
      ),
    );
  }

  Widget _assignmentCard(String id, String type, String area, String priority, String location, String time) {
    final Color priorityColor = priority == 'High' ? Colors.red : (priority == 'Medium' ? Colors.orange : Colors.green);
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))]),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(child: Text('#$id', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold))),
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: priorityColor, borderRadius: BorderRadius.circular(8)), child: Text(priority.toUpperCase(), style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))),
          ]),
          const SizedBox(height: 8),
          Row(children: [
            _pill(type, const Color(0xFF1E3A8A)),
            const SizedBox(width: 8),
            _pill(area, Colors.green),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            const Icon(Icons.location_on, size: 16, color: Colors.red),
            const SizedBox(width: 4),
            Text(location, style: GoogleFonts.inter(color: Colors.grey[700])),
            const SizedBox(width: 12),
            const Icon(Icons.access_time, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(time, style: GoogleFonts.inter(color: Colors.grey[600])),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: Text('Dispatcher note: Respond immediately, maintain radio contact.', style: GoogleFonts.inter(color: Colors.grey[700]))),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _primaryButton('Acknowledge')),
            const SizedBox(width: 12),
            Expanded(child: _secondaryButton('View Route')),
          ]),
        ],
      ),
    );
  }

  Widget _pill(String text, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: borderColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Text(text, style: GoogleFonts.inter(color: borderColor, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  Widget _primaryButton(String text) {
    return Container(
      height: 44,
      decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(12)),
      child: Center(child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))),
    );
  }

  Widget _secondaryButton(String text) {
    return Container(
      height: 44,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1E3A8A))),
      child: Center(child: Text(text, style: GoogleFonts.inter(color: const Color(0xFF1E3A8A), fontWeight: FontWeight.w600))),
    );
  }
}