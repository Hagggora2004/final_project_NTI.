import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../features/auth/providers/auth_provider.dart';
import '../../features/onboarding/screens/onboarding.dart';
import '../../features/auth/screens/login.dart';
import '../../features/home/screens/main_layout.dart';

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  Future<bool> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return FutureBuilder<bool>(
      future: _checkFirstTime(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        /// if first time.
        if (snapshot.data == true) {
          return const OnboardingScreen();
        }

        /// if not.
        if (auth.user == null) {
          return Login();
        }

        return MainLayout();
      },
    );
  }
}
