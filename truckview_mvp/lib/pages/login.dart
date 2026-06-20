import 'package:flutter/material.dart';
import 'package:truckview_mvp/pages/home.dart' ;
import 'package:truckview_mvp/pages/forgot_password.dart';
import 'package:truckview_mvp/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isValidEmail(String email) {
  return RegExp(
    r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
  ).hasMatch(email);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44), // Figma dark background

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // 🔷 Logo / Title
                const Text(
                  "TruckView Mobile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "We fix all vehicle types!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 30),

                // 🧾 Login Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [

                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Email
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7A00),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill all fields")),
    );
    return;
  }

  if (!isValidEmail(emailController.text)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Enter a valid email")),
    );
    return;
  }
  if (passwordController.text.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password must be at least 6 characters"),
      ),
    );
    return;
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
},
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Forgot password
                      TextButton(
                        onPressed: () {
                            Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ForgotPasswordPage(),
    ),
  );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xFF0A1F44)),
                        ),
                      ),
                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    const Text("Don't have an account?"),

    TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RegisterPage(),
          ),
        );
      },
      child: const Text("Register"),
    ),
  ],
),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}