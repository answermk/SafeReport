import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsInsights extends StatelessWidget {
  const AnalyticsInsights({super.key});

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

  Widget _header() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF1E3A8A),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Analytics & Insights', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Hotspots, trends, and KPIs', style: GoogleFonts.inter(color: Colors.white70)),
        ]),
      );

  Widget _content() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _kpiRow(),
          const SizedBox(height: 16),
          _card('Crime Hotspots', _heatmapPlaceholder()),
          const SizedBox(height: 16),
          _card('Weekly Incidents', _barChart()),
          const SizedBox(height: 16),
          _card('Response Time Trend', _lineChart()),
        ]),
      );

  Widget _kpiRow() => Row(children: [
        _kpi('Incidents', '128', const Color(0xFF1E3A8A)),
        const SizedBox(width: 12),
        _kpi('Avg Response', '6m', Colors.green),
        const SizedBox(width: 12),
        _kpi('Resolved', '74%', Colors.orange),
      ]);

  Widget _kpi(String label, String value, Color color) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))]),
          child: Column(children: [
            Text(value, style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 6),
            Text(label, style: GoogleFonts.inter(color: Colors.grey[700])),
          ]),
        ),
      );

  Widget _card(String title, Widget child) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.show_chart, color: Color(0xFF1E3A8A)),
            const SizedBox(width: 8),
            Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E3A8A))),
          ]),
          const SizedBox(height: 12),
          SizedBox(height: 180, child: child),
        ]),
      );

  Widget _barChart() => BarChart(BarChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(7, (i) => BarChartGroupData(x: i, barRods: [BarChartRodData(toY: (i + 3).toDouble(), color: const Color(0xFF1E3A8A), width: 12)])),
      ));

  Widget _lineChart() => LineChart(LineChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(spots: const [
            FlSpot(0, 9), FlSpot(1, 7), FlSpot(2, 6), FlSpot(3, 5.5), FlSpot(4, 6), FlSpot(5, 5), FlSpot(6, 4.8)
          ], isCurved: true, color: Colors.green, barWidth: 3, dotData: FlDotData(show: false))
        ],
      ));

  Widget _heatmapPlaceholder() => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: const LinearGradient(colors: [Color(0xFF1E3A8A), Colors.blue, Colors.green], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      );
}