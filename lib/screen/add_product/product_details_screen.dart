import 'package:badal/models/image_sliders_model.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/carousel_slider_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Sliders> listSliders = [
      Sliders(
        id: 0,
        title: "",
        isActive: true,
        imageURL:
            "https://cdn.arabsstock.com/uploads/images/98331/image-98331-brown-gulf-abaya-luxurious-modern-designs-fashion-elegance-preview.jpg",
      ),
      Sliders(
        id: 1,
        title: "",
        isActive: true,
        imageURL:
            "https://cdn.arabsstock.com/uploads/images/98344/image-98344-gulf-gowns-abayas-jalabiyas-models-distinctive-colors-gulf-preview.jpg",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        actions: [
          // SearchWithFilter(searchController: searchController),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall,
            CarouselSliderWidget(listSliders: listSliders),
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }
}
