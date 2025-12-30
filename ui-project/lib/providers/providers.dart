import 'package:flutter_template_web/providers/api_data_provider.dart';
import 'package:flutter_template_web/providers/login_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> appProviders(
  ApiDataProvider apiDataProvider,
) =>
    [
      ChangeNotifierProvider<LoginProvider>(
        create: (_) => LoginProvider(apiDataProvider),
      ),
    ];
