import 'package:flutter/material.dart';
import 'package:internship_task/core/theme/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;
  final double borderRadius;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onPress,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor:
              const WidgetStatePropertyAll(AppTheme.primaryRedColor),
          foregroundColor: const WidgetStatePropertyAll(AppTheme.whiteColor),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius), // Adjust the radius as needed
            ),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
