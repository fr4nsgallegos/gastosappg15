import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  VoidCallback? function;
  FieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        onTap: function,
        readOnly: function != null ? true : false,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade300,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
