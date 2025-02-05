import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
   final TextEditingController controller;
   final String hintText;
   final bool isRequired;
   final String labelText;

   CustomInputField({super.key, required this.controller, this.labelText="", this.hintText="", this.isRequired=false});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.labelText, style: const TextStyle(color: Colors.black, fontSize: 16)),
                widget.isRequired ? const Text(" *", style: TextStyle(color: Colors.red, fontSize: 16)) : const SizedBox(),
              ],
            ),
            const SizedBox(height: 5),
            TextField(
              controller: widget.controller, // Attach the controller here
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFDBDBDB)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFDBDBDB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF0095F6), width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
