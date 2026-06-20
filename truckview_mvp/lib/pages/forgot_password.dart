import 'package:flutter/material.dart';
import 'resetpassword.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  bool isValidEmail(String email) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
        title: const Text("Forgot Password"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email Address",
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (!isValidEmail(emailController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Enter a valid email"),
                    ),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResetPasswordPage(),
                  ),
                );
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}