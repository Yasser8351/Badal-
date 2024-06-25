import 'package:badal/models/image_sliders_model.dart';
import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/carousel_slider_widget.dart';
import 'package:badal/widgets/list_category_widget.dart';
import 'package:badal/widgets/list_product_widget.dart';
import 'package:badal/widgets/search_with_filter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List<Sliders> listSliders = [
      Sliders(id: 0, title: "", isActive: true, imageURL: AppImage.slider1),
      Sliders(id: 1, title: "", isActive: true, imageURL: AppImage.slider2),
      Sliders(id: 2, title: "", isActive: true, imageURL: AppImage.slider3),
    ];

    return Scaffold(
      /*  appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            SearchWithFilter(searchController: searchController),
          ],
        ),
      */
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceLarge,

            /// Search Form Faild
            SearchWithFilter(searchController: searchController),
            verticalSpaceSmall,
            CarouselSliderWidget(listSliders: listSliders),
            // verticalSpaceSmall,

            // List of Category  filtering List Products by Category
            const ListCategoryWidget(),

            /// List of Products
            const ListProductWidget(),
          ],
        ),
      ),
    );
  }
}
