import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShiftManagement extends StatelessWidget {
  const ShiftManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(child: Column(children: [_header(), Expanded(child: _content())])),
    );
  }

  Widget _header() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color(0xFF1E3A8A), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Shift & Availability', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Clock in/out, breaks, and schedule', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _statusCard(),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _action('Clock In', Icons.play_arrow, const Color(0xFF22C55E))),
            const SizedBox(width: 12),
            Expanded(child: _action('Break', Icons.pause, const Color(0xFFF59E0B))),
            const SizedBox(width: 12),
            Expanded(child: _action('Clock Out', Icons.stop, const Color(0xFFEF4444))),
          ]),
          const SizedBox(height: 16),
          _schedule(),
        ]),
      );

  Widget _statusCard() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
        child: Row(children: [
          const Icon(Icons.verified, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Status: On Duty', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
            Text('Since 08:00 • Sector 7', style: GoogleFonts.inter(color: Colors.grey[600], fontSize: 12)),
          ])),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.purple[100], borderRadius: BorderRadius.circular(16)), child: Text('Today', style: GoogleFonts.inter(color: Colors.purple[700]))),
        ]),
      );

  Widget _action(String label, IconData icon, Color color) => Container(
        height: 44,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white), const SizedBox(width: 6), Text(label, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))]),
      );

  Widget _schedule() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey[300]!)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Upcoming Schedule', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E3A8A))),
          const SizedBox(height: 10),
          _slot('Tue', '08:00 - 16:00', 'Patrol - Sector 7'),
          _slot('Wed', '12:00 - 20:00', 'Community event coverage'),
          _slot('Thu', '08:00 - 16:00', 'Traffic enforcement'),
        ]),
      );

  Widget _slot(String day, String time, String note) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          Container(width: 36, height: 36, decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(8)), child: Center(child: Text(day, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(time, style: GoogleFonts.inter(fontWeight: FontWeight.w600)), Text(note, style: GoogleFonts.inter(color: Colors.grey[600]))])),
        ]),
      );
}