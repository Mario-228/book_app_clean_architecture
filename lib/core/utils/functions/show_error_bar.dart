import 'package:flutter/material.dart';

SnackBar showErrorBar(String text) {
  return SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 2),
  );
}
