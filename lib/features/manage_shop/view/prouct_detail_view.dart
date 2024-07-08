import 'package:flutter/material.dart';
import 'package:internship_task/core/customWidgets/custom_image_withbadge.dart';
import 'package:internship_task/core/customWidgets/custom_widget.dart';
import 'package:internship_task/core/theme/colors.dart';
import 'package:internship_task/features/manage_shop/view/flavour_chat_view.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> fieldTitles = [
      'Veg',
      'Non Veg',
    ];

    // Define a list of dropdown options

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(
          title: "PRODUCT DETAILS",
          centerTitle: true,
          leadingWidget: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textformWithHeading(
                  'Product Name:', 'Enter Product Name', null, null),
              _textformWithHeading(
                  'Description:', 'Write Product Description', 500, 5),
              _textformWithHeading(
                  'Serving Information:', 'Write Serving Information', 500, 5),
              _textformWithHeading('Note:', 'Write Note', 500, 5),
              _elevatedButtonWithHeading(
                  heading: 'Flavour Chart', buttonHeading: 'Edit List'),
              _elevatedButtonWithHeading(
                  heading: 'Size and Price Chart', buttonHeading: 'Edit List'),
              _buildDropdownField('Veg/Non Veg:', fieldTitles),
              _elevatedButtonWithHeading(
                  heading: 'Add Shop Display Photo (Max 1):',
                  buttonHeading: 'Add Image'),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 50),
                child:
                    CustomImageWithDeleteButton(imagePath: "", onDelete: () {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: CustomElevatedButton(
                    title: "Save",
                    onPress: () => Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              // Return your destination screen widget here
                              return const FlavourChartView();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                            transitionDuration:
                                const Duration(milliseconds: 200),
                          ),
                        ),
                    borderRadius: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _elevatedButtonWithHeading(
      {required String heading, required String buttonHeading}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            heading,
            style: const TextStyle(color: AppTheme.ligthGrey),
          ),
        ),
        CustomElevatedButton(
          title: buttonHeading,
          onPress: null,
          borderRadius: 8,
        ),
      ],
    );
  }

  Widget _textformWithHeading(
    String heading,
    String hintText,
    int? maxlength,
    int? maxlines,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            heading,
            style: const TextStyle(fontSize: 16, color: AppTheme.ligthGrey),
          ),
        ),
        CustomTextField(
          hintText: hintText,
          maxLines: maxlines,
          maxLength: maxlength,
        ),
      ],
    );
  }

  Widget _buildDropdownField(String title, List<String> items) {
    String? dropdownValue;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: AppTheme.ligthGrey),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryRedColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            hint: const Text('Select Food Type'),
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (String? newValue) {
              dropdownValue = newValue!;
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
