import 'package:flutter/material.dart';
import 'login.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
        title: const Text("Reset Password"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "New Password",
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                if (passwordController.text.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password too short"),
                    ),
                  );
                  return;
                }

                if (passwordController.text !=
                    confirmController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Passwords do not match"),
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Password reset successful"),
                  ),
                );

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              child: const Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}