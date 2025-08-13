import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportsExports extends StatelessWidget {
  const ReportsExports({super.key});

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
          Text('Reports & Exports', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Generate PDF/CSV summaries', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _card('Select Report', Column(children: [
            _option('Daily Incident Summary'),
            _option('Response Time Breakdown'),
            _option('Resolved Cases Report'),
            _option('Watch Group Activity'),
          ])),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: _primary('Export PDF')),
            const SizedBox(width: 12),
            Expanded(child: _secondary('Export CSV')),
          ]),
        ]),
      );

  Widget _card(String title, Widget child) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E3A8A))), const SizedBox(height: 12), child]),
      );

  Widget _option(String label) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
        child: Row(children: [const Icon(Icons.description, color: Color(0xFF1E3A8A)), const SizedBox(width: 8), Expanded(child: Text(label, style: GoogleFonts.inter())), const Icon(Icons.check_circle, color: Colors.green)]),
      );

  Widget _primary(String text) => Container(height: 48, decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(12)), child: Center(child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))));
  Widget _secondary(String text) => Container(height: 48, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1E3A8A))), child: Center(child: Text(text, style: GoogleFonts.inter(color: const Color(0xFF1E3A8A), fontWeight: FontWeight.w600))));
}