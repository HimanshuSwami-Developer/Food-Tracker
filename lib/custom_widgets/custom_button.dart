import 'package:flutter/material.dart';

class CustomInstButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined; // Determines if the button is outlined or solid

  const CustomInstButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.white : const Color(0xFF0095F6),
          foregroundColor: isOutlined ? Colors.black : Colors.white,
          side: isOutlined ? const BorderSide(color: Color(0xFFDBDBDB)) : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
