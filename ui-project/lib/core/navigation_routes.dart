import 'package:flutter/widgets.dart';
import 'package:flutter_template_web/screens/default_page/default_page.dart';
import 'package:flutter_template_web/screens/home_page/home_page.dart';

var navigationAllowed = true;

const dashboardPage = DefaultPage();
const examplePage = BasePage();

const defaultPageRoute = "/";
const examplePageRoute = "/example";

final Map<String, Widget Function(BuildContext)> appRoutes = {
  defaultPageRoute: (_) => const DefaultPage(),
  examplePageRoute: (_) => examplePage,
};
