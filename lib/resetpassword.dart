// File: passwordpage.dart
import 'package:flutter/material.dart';

class ResetPasswordPagee extends StatelessWidget {
  const ResetPasswordPagee({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Blue Logo Area
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0066A1), Color(0xFF007DB8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/image/logo.png', // Replace with your actual logo
                height: 100,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported, size: 60, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Input Fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                _buildTextField("New Password", newPasswordController, true),
                const SizedBox(height: 20),
                _buildTextField("Confirm Password", confirmPasswordController, true),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Reset Button
          ElevatedButton(
            onPressed: () {
              if (newPasswordController.text.isEmpty ||
                  confirmPasswordController.text.isEmpty) {
                _showDialog(context, "Please fill in all fields.");
              } else if (newPasswordController.text != confirmPasswordController.text) {
                _showDialog(context, "Passwords do not match.");
              } else {
                _showDialog(context, "Password has been reset!");
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              backgroundColor: const Color(0xFF0066A1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 6,
            ),
            child: const Text(
              'Reset Password',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, bool obscure) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black54),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Reset Password"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
