import 'package:flutter/material.dart';

extension DarkMode on BuildContext {

  // Возвращает true, если включён тёмный режим
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}