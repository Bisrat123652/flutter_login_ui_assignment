import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String validEmail = 'bisrattamrat2@gmail.com';
  final String validPassword = 'ad23#';

  String message = '';

  void validateLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty && password.isEmpty) {
      setState(() {
        message = "Please enter your email and password.";
      });
    } else if (email.isEmpty) {
      setState(() {
        message = "Please enter your email.";
      });
    } else if (password.isEmpty) {
      setState(() {
        message = "Please enter your password.";
      });
    } else if (email == validEmail && password == validPassword) {
      setState(() {
        message = "Login successful! Welcome!";
      });
    } else {
      setState(() {
        message = "Incorrect email or password. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: validateLogin,
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: TextStyle(
                  color:
                      message.contains("successful")
                          ? Colors.green
                          : Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
