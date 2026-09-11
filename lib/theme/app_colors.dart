import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const Color background = Color(0xFF0D0D1A);
  static const Color surface = Color(0xFF1A1A2E);
  static const Color surfaceVariant = Color(0xFF16213E);

  // Button colors
  static const Color numberBtn = Color(0xFF1E1E30);
  static const Color operatorBtn = Color(0xFF6C63FF);
  static const Color functionBtn = Color(0xFF252545);
  static const Color specialBtn = Color(0xFF2A2A4A);
  static const Color equalBtn = Color(0xFF6C63FF);
  static const Color clearBtn = Color(0xFF3D1A1A);
  static const Color deleteBtn = Color(0xFF1A2A3D);

  // Text colors
  static const Color primaryText = Color(0xFFE8E8F0);
  static const Color secondaryText = Color(0xFF9898B0);
  static const Color accentText = Color(0xFF6C63FF);
  static const Color operatorText = Color(0xFFFFFFFF);

  // Gradient colors
  static const Color gradientStart = Color(0xFF6C63FF);
  static const Color gradientEnd = Color(0xFF8B5CF6);

  // Glow/accent
  static const Color glow = Color(0x556C63FF);
  static const Color glowBright = Color(0xAA6C63FF);

  // Error
  static const Color error = Color(0xFFFF6B6B);
}

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0D0D1A), Color(0xFF1A1A2E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient displayGradient = LinearGradient(
    colors: [Color(0xFF12122A), Color(0xFF1E1E3F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
