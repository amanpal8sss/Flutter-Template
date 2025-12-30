import 'package:flutter/material.dart';
import 'package:flutter_template_web/providers/login_provider.dart';
import 'package:provider/provider.dart';

/// Returns the requested [Provider] instance
///
/// Takes [BuildContext] and optional [listen]
/// parameter as input
///
/// if [listen] sets to true
/// returns a vesion of the requested [Provider]
/// that will listen to [ChangeNotifier] class
/// whenever [ChangeNotifier.notifyListeners] method gets called
/// and rebuilds the UI

LoginProvider getLoginProvider(BuildContext context, {bool listen = false}) =>
    Provider.of<LoginProvider>(context, listen: listen);
