import 'package:flutter/material.dart';
import 'package:internship_task/core/customWidgets/custom_widget.dart';
import 'package:internship_task/core/theme/colors.dart';
import 'package:internship_task/features/manage_shop/view/prouct_detail_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "CATEGORIES",
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _categoriesSelected("Cake", Icons.cancel_outlined, null),
            _categoriesSelected("Pizza", Icons.cancel_outlined, null),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                'Other Categories',
                style: TextStyle(fontSize: 16),
              ),
            ),
            _categoriesSelected("Burger", Icons.add, null),
            _categoriesSelected(
              "Roti",
              Icons.add,
              () => Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    // Return your destination screen widget here
                    return const ProductDetailsView();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds:  200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _categoriesSelected(String title, IconData icon, Function()? onTap) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 16.0, color: AppTheme.primaryRedColor),
          ),
          trailing: Icon(
            icon,
            color: AppTheme.primaryRedColor,
          ),
          onTap: onTap),
    ),
  );
}
