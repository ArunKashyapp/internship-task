import 'package:flutter/material.dart';
import 'package:internship_task/core/customWidgets/custom_image_withbadge.dart';
import 'package:internship_task/core/customWidgets/custom_widget.dart';
import 'package:internship_task/core/theme/colors.dart';
import 'package:internship_task/features/manage_shop/view/manage_shop_item_view.dart';

class ManageShopView extends StatelessWidget {
  const ManageShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "MANAGE SHOP",
          centerTitle: true,
          leadingWidget: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _upperHalf(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomElevatedButton(
                title: "Manage Shop Items",
                onPress: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        // Return your destination screen widget here
                        return const ManageShopItemView();
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
                borderRadius: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _upperHalf() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Shop Name:',
        style: TextStyle(fontSize: 16),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 5, bottom: 20),
        child: Text(
          'Hub Quality Bakers:',
          style: TextStyle(fontSize: 16, color: AppTheme.ligthGrey),
        ),
      ),
      const Text(
        'Add Shop Display Photo (Max 1):',
        style: TextStyle(fontSize: 16),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 10,bottom: 15),
        child: CustomElevatedButton(
            title: "Add Image", onPress: null, borderRadius: 8),
      ),
      CustomImageWithDeleteButton(imagePath: "", onDelete: () {})
    ],
  );
}
