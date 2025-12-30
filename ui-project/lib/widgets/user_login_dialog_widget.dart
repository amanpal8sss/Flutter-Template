import 'package:flutter/material.dart';
import 'package:flutter_template_web/utils/get_provider.dart';

class UserLoginDialogWidget extends StatefulWidget {
  const UserLoginDialogWidget({super.key});

  @override
  State<UserLoginDialogWidget> createState() => _UserLoginDialogWidgetState();
}

class _UserLoginDialogWidgetState extends State<UserLoginDialogWidget> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
  

  void _submit() {
    final loginProvider = getLoginProvider(context);
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (password.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    // handle submit logic
    debugPrint('Email: $email');
    debugPrint('Password: $password');
    loginProvider.signIn(email);
    if (loginProvider.userDetails?.email != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Logged In successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entered Invalid Email/password!')),
      );
    }
    Navigator.pop(context); // close dialog
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('User Details'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
