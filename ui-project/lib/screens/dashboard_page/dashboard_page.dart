import 'package:flutter/material.dart';
import 'package:flutter_template_web/core/navigation_routes.dart';
import 'package:flutter_template_web/utils/app_helper.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget get _appScaffold {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.dashboard),
          label: const Text("Click To Explore Dashboard Features"),
          onPressed: () => navigateToScreen(context, examplePageRoute),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) {
            switch (settings.name) {
              // future dashboard routes
              // case '/profile':
              //   return ProfileScreen();
              case examplePageRoute:
                return examplePage;

              default:
                return _appScaffold;
            }
          },
        );
      },
    );
  }
}
