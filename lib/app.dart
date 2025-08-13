import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

class SafeReportApp extends StatelessWidget {
  const SafeReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeReport',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}