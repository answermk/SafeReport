import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityPrivacy extends StatelessWidget {
  const SecurityPrivacy({super.key});

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
          Text('Security & Privacy', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Sessions, devices, and audit', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _card('Active Sessions', Column(children: [
            _session('Android • Officer Martinez', 'Sector 7 • Last active 3m ago', true),
            _session('iPad • Patrol Unit #12', 'HQ • Last active 1h ago', false),
          ])),
          const SizedBox(height: 16),
          _card('Device Permissions', Column(children: [
            _toggle('Location Services', true),
            _toggle('Camera Access', true),
            _toggle('Microphone Access', false),
            _toggle('Background Refresh', true),
          ])),
          const SizedBox(height: 16),
          _card('Audit & Data', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _audit('Last password change: 23 days ago'),
            _audit('Two-factor authentication: Enabled'),
            _audit('Privacy mode: On (mask PII in previews)'),
            const SizedBox(height: 12),
            Row(children: [Expanded(child: _danger('Sign out other sessions')), const SizedBox(width: 12), Expanded(child: _secondary('Export activity log'))]),
          ])),
        ]),
      );

  Widget _card(String title, Widget child) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E3A8A))), const SizedBox(height: 10), child]),
      );

  Widget _session(String device, String subtitle, bool current) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
        child: Row(children: [const Icon(Icons.devices, color: Color(0xFF1E3A8A)), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(device, style: GoogleFonts.inter(fontWeight: FontWeight.w600)), Text(subtitle, style: GoogleFonts.inter(color: Colors.grey[600]))])), if (current) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(12)), child: Text('Current', style: GoogleFonts.inter(color: Colors.green[800], fontSize: 12)))]),
      );

  Widget _toggle(String label, bool value) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: GoogleFonts.inter()), Switch(value: value, onChanged: (_) {})]);
  Widget _audit(String text) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(children: [const Icon(Icons.verified_user, color: Colors.green, size: 18), const SizedBox(width: 8), Expanded(child: Text(text, style: GoogleFonts.inter()))]));
  Widget _danger(String text) => Container(height: 44, decoration: BoxDecoration(color: const Color(0xFFEF4444), borderRadius: BorderRadius.circular(12)), child: Center(child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))));
  Widget _secondary(String text) => Container(height: 44, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1E3A8A))), child: Center(child: Text(text, style: GoogleFonts.inter(color: const Color(0xFF1E3A8A), fontWeight: FontWeight.w600))));
}