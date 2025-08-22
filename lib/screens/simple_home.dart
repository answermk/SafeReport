import 'package:flutter/material.dart';
import 'main_navigation.dart';
import 'success_dialogs_demo.dart';
import 'screen_navigator.dart';

class SimpleHome extends StatelessWidget {
  const SimpleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo/Title
              const Icon(
                Icons.shield,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 24),
              const Text(
                'SafeReport',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Crime Prevention Platform',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 60),
              
              // Navigation Buttons
              _buildNavigationButton(
                context,
                'Go to Main App',
                Icons.home,
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainNavigation()),
                ),
              ),
              
              const SizedBox(height: 16),
              
              _buildNavigationButton(
                context,
                'Test Success Dialogs',
                Icons.check_circle,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SuccessDialogsDemo()),
                ),
              ),
              
              const SizedBox(height: 16),
              
                             _buildNavigationButton(
                 context,
                 'Screen Navigator',
                 Icons.explore,
                 () => Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const ScreenNavigator()),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1E3A8A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }
}

// Keep the AllScreensFlow for development purposes
class AllScreensFlow extends StatefulWidget {
  const AllScreensFlow({super.key});

  @override
  State<AllScreensFlow> createState() => _AllScreensFlowState();
}

class _AllScreensFlowState extends State<AllScreensFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _screens = const [
    // Add your screens here if needed
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Viewer'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Screen Viewer - Add screens here for development',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
