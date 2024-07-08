import 'package:flutter/material.dart';
import 'package:internship_task/core/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  const CustomTextField({
    super.key,
    this.maxLength,
    this.hintText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppTheme.primaryRedColor,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppTheme.primaryRedColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.ligthGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.ligthGrey,
          ),
        ),
        // Remove the underline when the user writes text
       
       
      ),
    );
  }
}
