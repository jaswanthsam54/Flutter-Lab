import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CalculatorButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final bool isHighlighted;
  final bool hasGlow;
  final bool isGradient;
  final double fontSize;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.isHighlighted = false,
    this.hasGlow = false,
    this.isGradient = false,
    this.fontSize = 22,
  });

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.92).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onTapUp(_) {
    setState(() => _isPressed = false);
    _controller.reverse();
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 66,
          decoration: BoxDecoration(
            gradient: widget.isGradient
                ? AppGradients.primaryGradient
                : null,
            color: widget.isGradient
                ? null
                : _isPressed
                    ? widget.backgroundColor.withOpacity(0.7)
                    : widget.backgroundColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: widget.isHighlighted
                  ? AppColors.accentText.withOpacity(0.6)
                  : widget.backgroundColor == AppColors.numberBtn
                      ? Colors.white.withOpacity(0.05)
                      : Colors.transparent,
              width: 1,
            ),
            boxShadow: widget.hasGlow
                ? [
                    BoxShadow(
                      color: AppColors.glow,
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: AppColors.glowBright.withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 4,
                    ),
                  ]
                : widget.backgroundColor != Colors.transparent
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
          ),
          child: Center(
            child: widget.label.isNotEmpty
                ? Text(
                    widget.label,
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'monospace',
                      height: 1.0,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
