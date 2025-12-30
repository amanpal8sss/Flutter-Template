import 'package:flutter/material.dart';
import 'package:flutter_template_web/core/navigation_routes.dart';
import 'package:flutter_template_web/providers/api_data_provider.dart';
import 'package:flutter_template_web/providers/providers.dart';
import 'package:provider/provider.dart';

final _apiDataProvider = ApiDataProvider();

void main() {
  runApp(MyApp(
    apiDataProvider: _apiDataProvider,
  ));
}

class MyApp extends StatelessWidget {
  final ApiDataProvider apiDataProvider;
  const MyApp({
    super.key,
    required this.apiDataProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders(apiDataProvider),
      child: MaterialApp(
        title: 'PROJECT',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(),
        routes: appRoutes,
      ),
    );
  }
}
