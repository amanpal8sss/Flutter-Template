import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template_web/providers/login_provider.dart';
import 'package:flutter_template_web/homepage.dart';
import 'package:flutter_template_web/screens/dashboard_page/dashboard_page.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, _) {
        if (loginProvider.isAuthenticated) {
          return const DashboardScreen();
        } else {
          return const MyHomePage();
        }
      },
    );
  }
}
