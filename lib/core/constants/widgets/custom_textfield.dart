import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final textInputTypee;
  final ispassword;
  final String hinttttext;
  final TextEditingController controller;
  final enabled;

  Mytextfield({
    required this.textInputTypee,
    required this.ispassword,
    required this.hinttttext,
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: textInputTypee,
      obscureText: ispassword,
      style: const TextStyle(
        color: Color.fromARGB(255, 14, 0, 0),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hinttttext,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 68, 28, 68),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.40),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.7),
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
