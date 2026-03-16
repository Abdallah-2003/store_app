import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText, this.onChanged});

  final String? hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onChanged: onChanged,
      keyboardAppearance: Brightness.dark,
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        )
      ),
    );
  }
}