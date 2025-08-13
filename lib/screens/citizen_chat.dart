import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CitizenChat extends StatelessWidget {
  const CitizenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(child: Column(children: [_header(), Expanded(child: _messages()), _composer()])),
    );
  }

  Widget _header() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Color(0xFF1E3A8A)),
        child: Row(children: [
          const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Color(0xFF1E3A8A))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Anonymous Reporter', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600)),
            Text('End-to-end encrypted', style: GoogleFonts.inter(color: Colors.white70, fontSize: 12)),
          ])),
          const Icon(Icons.lock, color: Colors.white70),
        ]),
      );

  Widget _messages() => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _bubble('Thanks for your report. Can you share a photo of the vehicle?', false),
          _bubble('Yes, sending now.', true),
          _bubble('Photo received. Officers are en route, ETA 4 minutes.', false),
        ],
      );

  Widget _bubble(String text, bool mine) => Align(
        alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          constraints: const BoxConstraints(maxWidth: 260),
          decoration: BoxDecoration(color: mine ? const Color(0xFF1E3A8A) : Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [if (!mine) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]),
          child: Text(text, style: GoogleFonts.inter(color: mine ? Colors.white : Colors.black87)),
        ),
      );

  Widget _composer() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))]),
        child: Row(children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle, color: Color(0xFF1E3A8A))),
          Expanded(child: TextField(decoration: InputDecoration(hintText: 'Message…', border: InputBorder.none)) ),
          Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(12)), child: Text('Send', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))),
        ]),
      );
}