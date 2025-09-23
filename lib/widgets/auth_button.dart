import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;

  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = primaryBrown,
    this.borderColor = buttonBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 99,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor!, width: 2),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: buttonBorderRadius,
          ),
          // Reduce padding to ensure text fits
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: Text(
            text,
            style: buttonTextStyle.copyWith(
              color: backgroundColor == primaryBrown ? Colors.white : primaryBrown,
              // Ensure text size is appropriate
              fontSize: 14,
            ),
            // Prevent text overflow
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}