import 'package:flutter/material.dart';
import 'package:flutter_template_web/core/navigation_routes.dart';


const genericErrorMessage = "Something went wrong. Please try again later.";

Exception appException([String? msg]) => Exception(
      msg?.trim().isNotEmpty == true ? msg?.trim() : genericErrorMessage,
    );

void navigateToScreen(BuildContext context, String routeName) {
  navigationAllowed = false;
  Navigator.of(context).pushNamed(routeName);
}
