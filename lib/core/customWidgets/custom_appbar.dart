import 'package:flutter/material.dart';
import 'package:internship_task/core/theme/colors.dart';

class CustomAppBar extends StatelessWidget {
  final double? leadingWidth;

  final VoidCallback? actionButtonOnPressed;

  final List<Widget>? actionButton;
  final String title;
  final bool? centerTitle;
  final Widget? leadingWidget;
  const CustomAppBar({
    super.key,
    this.leadingWidth,
    this.actionButtonOnPressed,
    this.actionButton,
    this.leadingWidget,
    required this.title,
    required this.centerTitle,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppTheme.whiteColor,
        elevation: 0,
        centerTitle: centerTitle,
        leadingWidth: leadingWidth,
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.of(context).pop()),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        actions: actionButton);
  }
}
