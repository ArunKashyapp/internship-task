import 'package:flutter/material.dart';
import 'package:internship_task/core/theme/colors.dart';

class CustomImageWithDeleteButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onDelete;

  const CustomImageWithDeleteButton({
    super.key,
    required this.imagePath,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 61,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            image: DecorationImage(
              image: AssetImage(
                  imagePath), // Use NetworkImage if it's a network image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: onDelete,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppTheme.whiteColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete,
                size: 16,
                color: AppTheme.primaryRedColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
