import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldReport extends StatefulWidget {
  const FieldReport({super.key});

  @override
  State<FieldReport> createState() => _FieldReportState();
}

class _FieldReportState extends State<FieldReport> {
  String category = 'Suspicious Person';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(children: [
          _header(),
          Expanded(child: _form()),
        ]),
      ),
    );
  }

  Widget _header() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color(0xFF1E3A8A), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('New Field Report', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Create and submit incident details', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _form() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Category', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.grey[800])),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: [
            _chip('Suspicious Person'),
            _chip('Vehicle Activity'),
            _chip('Abandoned Package'),
            _chip('Drug Activity'),
          ]),
          const SizedBox(height: 16),
          _textField('Title', 'Brief incident title'),
          const SizedBox(height: 12),
          _textField('Location', 'Address or landmark'),
          const SizedBox(height: 12),
          _textArea('Description', 'Describe what you observed...'),
          const SizedBox(height: 12),
          _attachments(),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(child: _primary('Submit Report')),
            const SizedBox(width: 12),
            Expanded(child: _secondary('Save Draft')),
          ]),
        ]),
      );

  Widget _chip(String label) {
    final selected = category == label;
    return GestureDetector(
      onTap: () => setState(() => category = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: selected ? const Color(0xFF8B5CF6) : Colors.white, border: Border.all(color: selected ? const Color(0xFF8B5CF6) : Colors.grey[300]!), borderRadius: BorderRadius.circular(20)),
        child: Text(label, style: GoogleFonts.inter(color: selected ? Colors.white : Colors.grey[800], fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _textField(String label, String hint) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.grey[800])),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
          child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: hint)),
        ),
      ]);

  Widget _textArea(String label, String hint) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.grey[800])),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
          child: TextField(maxLines: 6, decoration: InputDecoration(contentPadding: const EdgeInsets.all(12), border: InputBorder.none, hintText: hint)),
        ),
      ]);

  Widget _attachments() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Attachments', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.grey[800])),
        const SizedBox(height: 8),
        Row(children: [
          _attachTile(Icons.photo_camera, 'Add Photo'),
          const SizedBox(width: 12),
          _attachTile(Icons.videocam, 'Add Video'),
          const SizedBox(width: 12),
          _attachTile(Icons.mic, 'Add Audio'),
        ]),
      ]);

  Widget _attachTile(IconData icon, String label) => Expanded(
        child: Container(
          height: 64,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: const Color(0xFF1E3A8A)), const SizedBox(width: 8), Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF1E3A8A)))]),
        ),
      );

  Widget _primary(String text) => Container(height: 48, decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(12)), child: Center(child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))));
  Widget _secondary(String text) => Container(height: 48, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1E3A8A))), child: Center(child: Text(text, style: GoogleFonts.inter(color: const Color(0xFF1E3A8A), fontWeight: FontWeight.w600))));
}