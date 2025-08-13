import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpTraining extends StatelessWidget {
  const HelpTraining({super.key});

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
          Text('Help & Training', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Tutorials, SOPs, and FAQs', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => ListView(padding: const EdgeInsets.all(16), children: [
        _section('Tutorials', [
          _item(Icons.play_circle, 'Getting Started for Officers'),
          _item(Icons.map, 'Using the Tactical Map'),
          _item(Icons.shield, 'Evidence Handling & Chain of Custody'),
        ]),
        const SizedBox(height: 16),
        _section('Standard Operating Procedures (SOPs)', [
          _item(Icons.description, 'Incident Response Protocol'),
          _item(Icons.description, 'Pursuit Policy Overview'),
          _item(Icons.description, 'Use of Force Reporting'),
        ]),
        const SizedBox(height: 16),
        _section('Frequently Asked Questions', [
          _item(Icons.help, 'How do I contact dispatch?'),
          _item(Icons.help, 'How do I upload evidence later?'),
          _item(Icons.help, 'How to handle connectivity issues?'),
        ]),
      ]);

  Widget _section(String title, List<Widget> children) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E3A8A))), const SizedBox(height: 10), ...children]),
      );

  Widget _item(IconData icon, String title) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
        child: Row(children: [Icon(icon, color: const Color(0xFF1E3A8A)), const SizedBox(width: 8), Expanded(child: Text(title, style: GoogleFonts.inter())), const Icon(Icons.chevron_right, color: Colors.grey)]),
      );
}