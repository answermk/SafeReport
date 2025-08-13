import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamRoster extends StatelessWidget {
  const TeamRoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(child: Column(children: [_header(), Expanded(child: _list())])),
    );
  }

  Widget _header() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color(0xFF1E3A8A), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Team Roster', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Who is on duty and where', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _list() => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _officer('Officer Johnson', 'Sector 5 • On Call', Colors.green),
          _officer('Officer Martinez', 'Sector 7 • On Patrol', Colors.green),
          _officer('Officer Chen', 'HQ • Report Writing', Colors.orange),
          _officer('Officer Williams', 'Off Duty', Colors.grey),
        ],
      );

  Widget _officer(String name, String status, Color dot) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
        child: Row(children: [
          Stack(children: [
            const CircleAvatar(radius: 22, backgroundColor: Color(0xFF1E3A8A), child: Icon(Icons.person, color: Colors.white)),
            Positioned(right: 0, bottom: 0, child: Container(width: 12, height: 12, decoration: BoxDecoration(color: dot, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)))),
          ]),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.w600)), Text(status, style: GoogleFonts.inter(color: Colors.grey[600]))])),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ]),
      );
}