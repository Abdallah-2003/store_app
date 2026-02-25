import 'package:flutter/material.dart';

void showScafold(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message)
    )
  );
}