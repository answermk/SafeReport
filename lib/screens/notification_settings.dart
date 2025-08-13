import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool push = true;
  bool sms = false;
  bool email = true;
  double quietStart = 22; // 22:00
  double quietEnd = 6; // 06:00

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
          Text('Notification Settings', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Channels, priority rules, and quiet hours', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _card('Channels', Column(children: [
            _toggle('Push notifications', push, (v) => setState(() => push = v)),
            _toggle('SMS', sms, (v) => setState(() => sms = v)),
            _toggle('Email', email, (v) => setState(() => email = v)),
          ])),
          const SizedBox(height: 16),
          _card('Priority Rules', Column(children: [
            _rule('Urgent alerts always bypass quiet hours'),
            _rule('High-priority only vibrate during quiet hours'),
            _rule('Medium and lower are batched every 15 min'),
          ])),
          const SizedBox(height: 16),
          _card('Quiet Hours', Column(children: [
            Row(children: [Expanded(child: Text('Start: ${quietStart.toInt()}:00', style: GoogleFonts.inter())), Expanded(child: Slider(min: 0, max: 23, value: quietStart, onChanged: (v) => setState(() => quietStart = v)))]),
            Row(children: [Expanded(child: Text('End: ${quietEnd.toInt()}:00', style: GoogleFonts.inter())), Expanded(child: Slider(min: 0, max: 23, value: quietEnd, onChanged: (v) => setState(() => quietEnd = v)))]),
          ])),
        ]),
      );

  Widget _card(String title, Widget child) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E3A8A))), const SizedBox(height: 12), child]),
      );

  Widget _toggle(String label, bool value, ValueChanged<bool> onChanged) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: GoogleFonts.inter()), Switch(value: value, onChanged: onChanged)]);
  Widget _rule(String text) => Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Row(children: [const Icon(Icons.policy, color: Colors.orange, size: 18), const SizedBox(width: 8), Expanded(child: Text(text, style: GoogleFonts.inter()))]));
}