import 'package:flutter/material.dart';
import 'package:internship_task/core/customWidgets/custom_widget.dart';

class FlavourChartView extends StatelessWidget {
  const FlavourChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "FLAVOUR CHART",
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: "Enter Flavour",
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: CustomTextField(
                hintText: "Enter Flavour",
              ),
            ),
            CustomElevatedButton(
                title: "Insert Another Field", onPress: null, borderRadius: 8)
          ],
        ),
      ),
    );
  }
}
