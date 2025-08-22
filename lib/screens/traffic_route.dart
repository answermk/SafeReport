import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrafficRoute extends StatelessWidget {
  const TrafficRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(child: _content()),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1E3A8A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Traffic & Route', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Live traffic conditions and best route', style: GoogleFonts.inter(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _chip(Icons.traffic, 'Moderate', Colors.orange),
                const SizedBox(width: 8),
                _chip(Icons.directions_car, 'Incidents: 2', Colors.red),
                const SizedBox(width: 8),
                _chip(Icons.route, 'Tolls: None', Colors.green),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _etaCard(),
          const SizedBox(height: 16),
          _routesList(),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), // Reduced padding
      decoration: BoxDecoration(
        color: color.withOpacity(0.08), 
        borderRadius: BorderRadius.circular(16), // Reduced radius
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Prevent expansion
        children: [
          Icon(icon, size: 14, color: color), // Smaller icon
          const SizedBox(width: 4), // Reduced spacing
          Text(
            label, 
            style: GoogleFonts.inter(
              color: color, 
              fontWeight: FontWeight.w600,
              fontSize: 12, // Smaller font
            ),
          ),
        ],
      ),
    );
  }

  Widget _etaCard() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))]),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Icon(Icons.location_searching, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(child: Text('Current → Downtown Plaza (DA-2025-0041)', style: GoogleFonts.inter(fontWeight: FontWeight.w600))),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          _etaTile('ETA', '11 min', const Color(0xFF1E3A8A)),
          _etaTile('Distance', '4.2 km', Colors.green),
          _etaTile('Traffic', 'Moderate', Colors.orange),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: _primaryButton('Start Navigation')),
          const SizedBox(width: 12),
          Expanded(child: _secondaryButton('Share ETA')),
        ]),
      ]),
    );
  }

  Widget _etaTile(String label, String value, Color color) {
    return Expanded(
      child: Column(children: [
        Text(value, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.inter(color: Colors.grey[600])),
      ]),
    );
  }

  Widget _routesList() {
    Widget route(String name, String eta, String distance, Color color) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)),
        child: Row(children: [
          Icon(Icons.alt_route, color: color),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text('$eta • $distance', style: GoogleFonts.inter(color: Colors.grey[600])),
          ])),
          _secondaryButton('Use'),
        ]),
      );
    }

    return Column(children: [
      route('Fastest via River Rd', '11 min', '4.2 km', const Color(0xFF1E3A8A)),
      route('Low Traffic via 5th Ave', '13 min', '4.6 km', Colors.green),
      route('No Left Turns', '15 min', '5.1 km', Colors.orange),
    ]);
  }

  Widget _primaryButton(String text) => Container(height: 44, decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(12)), child: Center(child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600))));
  Widget _secondaryButton(String text) => Container(height: 44, padding: const EdgeInsets.symmetric(horizontal: 16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1E3A8A))), child: Center(child: Text(text, style: GoogleFonts.inter(color: const Color(0xFF1E3A8A), fontWeight: FontWeight.w600))));
}