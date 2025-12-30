import 'package:flutter/material.dart';
import 'package:flutter_template_web/utils/get_provider.dart';
// import 'package:flutter_template_web/widgets/user_login_dialog_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = getLoginProvider(context);
    return Scaffold(
      body: Center(
        child: Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text("Sign in with Google"),
              onPressed: () {
                loginProvider.signInWithGoogle();
              },
            )),
      ),
      backgroundColor: Colors.blueGrey[900],
    );
  }
}
