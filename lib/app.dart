import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/onboarding_screen_1.dart';
import 'screens/onboarding_screen_2.dart';
import 'screens/onboarding_screen_3.dart';
import 'screens/onboarding_screen_4.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/check_email_screen.dart';

// Officer/Admin Screens (only import what's needed for navigation)
import 'screens/main_navigation.dart';
import 'screens/live_incident_feed.dart';
import 'screens/emergency_response_dashboard.dart';
import 'screens/crime_pattern_analysis.dart';
import 'screens/predictive_policing.dart';
import 'screens/anonymous_tip_processing.dart';
import 'screens/mobile_field_operations.dart' as mobile_ops;

// Import screens for navigation routes
import 'screens/active_cases.dart';
import 'screens/tactical_map.dart';
import 'screens/reports_exports.dart';
import 'screens/officer_comms.dart';
import 'screens/settings_profile.dart';

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
      home: const OnboardingFlow(),
      routes: {
        '/active_cases': (context) => const ActiveCases(),
        '/tactical_map': (context) => const TacticalMap(),
        '/reports_exports': (context) => const ReportsExports(),
        '/officer_comms': (context) => const OfficerComms(),
        '/settings_profile': (context) => const SettingsProfile(),
      },
    );
  }
}

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _screens = [
    // Onboarding & Welcome
    const WelcomeScreen(),
    const OnboardingScreen1(),
    const OnboardingScreen2(),
    const OnboardingScreen3(),
    const OnboardingScreen4(),
    
    // Authentication
    const LoginScreen(),
    const SignupScreen(),
    const ForgotPasswordScreen(),
    const CheckEmailScreen(),
    
    // Main App Screens
    const MainNavigation(),
    
    // Additional Officer/Admin Screens (not accessible through MainNavigation)
    const LiveIncidentFeed(),
    const EmergencyResponseDashboard(),
    const CrimePatternAnalysis(),
    const PredictivePolicing(),
    const AnonymousTipProcessing(),
    const mobile_ops.MobileFieldOperations(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _screens.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      // Navigate to main app
      _navigateToMainApp();
    }
  }

  void _skipTutorial() {
    _navigateToMainApp();
  }

  void _navigateToMainApp() {
    // Navigate to the main navigation which provides access to all screens
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: _screens,
      ),
      floatingActionButton: _currentPage < _screens.length - 1
          ? FloatingActionButton(
              onPressed: _nextPage,
              child: const Icon(Icons.arrow_forward),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
