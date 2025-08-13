import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MediaCapture extends StatelessWidget {
  const MediaCapture({super.key});

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
          Text('Media Capture', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Photo, video, audio with custody record', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _card('Capture Options', Column(children: [
            _tile(Icons.photo_camera, 'Take Photo'),
            _tile(Icons.videocam, 'Record Video'),
            _tile(Icons.mic, 'Record Audio'),
          ])),
          const SizedBox(height: 16),
          _card('Chain of Custody', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _step('Timestamped capture logged'),
            _step('Officer ID linked and hashed'),
            _step('Location metadata attached'),
            _step('Checksum generated for integrity'),
          ])),
        ]),
      );

  Widget _card(String title, Widget child) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Icon(Icons.folder, color: Color(0xFF1E3A8A)), const SizedBox(width: 8), Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E3A8A)))]),
          const SizedBox(height: 10),
          child,
        ]),
      );

  Widget _tile(IconData icon, String label) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
        child: Row(children: [Icon(icon, color: const Color(0xFF1E3A8A)), const SizedBox(width: 10), Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600))]),
      );

  Widget _step(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [const Icon(Icons.check_circle, color: Colors.green, size: 18), const SizedBox(width: 8), Expanded(child: Text(text, style: GoogleFonts.inter(color: Colors.grey[800])))]),
      );
}