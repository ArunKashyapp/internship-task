import 'package:flutter/material.dart';
import 'package:internship_task/core/customWidgets/custom_widget.dart';
import 'package:internship_task/core/theme/colors.dart';
import 'package:internship_task/features/manage_shop/view/categories_view.dart';

class ManageShopItemView extends StatelessWidget {
  const ManageShopItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "MANAGE SHOP ITEMS",
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _upperHalf(context),
          ],
        ),
      ),
    );
  }
}

Widget _upperHalf(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.greyColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Total Listed Items:'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                '100',
                style: TextStyle(color: AppTheme.primaryRedColor),
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 25),
        child: CustomElevatedButton(
            title: "Add Product Category", onPress: null, borderRadius: 8),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Text(
          'Categories Selected:',
          style: TextStyle(fontSize: 16),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: ListTile(
          title: const Text(
            'Cake',
            style: TextStyle(fontSize: 16.0),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  // Return your destination screen widget here
                  return const CategoriesView();
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
                transitionDuration: const Duration(milliseconds: 200),
              ),
            );
          },
        ),
      ),
    ],
  );
}
