import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfflineSync extends StatelessWidget {
  const OfflineSync({super.key});

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
          Text('Offline Sync', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Queued uploads and conflict resolution', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _statusBanner(),
          const SizedBox(height: 12),
          _queueItem('Field Report Draft', '3 attachments • waiting for network'),
          _queueItem('Photo Evidence', 'Checksum ready • pending upload'),
          _queueItem('Case Note Update', 'Conflict: newer version on server'),
          const SizedBox(height: 16),
          Row(children: [Expanded(child: _primary('Sync Now')), const SizedBox(width: 12), Expanded(child: _secondary('Resolve Conflicts'))]),
        ]),
      );

  Widget _statusBanner() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.yellow[100], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.yellow[700]!)),
        child: Row(children: [const Icon(Icons.wifi_off, color: Colors.orange), const SizedBox(width: 8), Expanded(child: Text('Working offline. Changes will sync automatically when online.', style: GoogleFonts.inter()))]),
      );

  Widget _queueItem(String title, String subtitle) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
        child: Row(children: [const Icon(Icons.cloud_upload, color: Color(0xFF1E3A8A)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600)), Text(subtitle, style: GoogleFonts.inter(color: Colors.grey[600]))])), const Icon(Icons.chevron_right, color: Colors.grey)]),
      );

  Widget _primary(String text) => Container(height: 48, decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(12)), child: Center(child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))));
  Widget _secondary(String text) => Container(height: 48, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1E3A8A))), child: Center(child: Text(text, style: GoogleFonts.inter(color: const Color(0xFF1E3A8A), fontWeight: FontWeight.w600))));
}