import 'package:badal/controller/products_controller.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/search_with_filter.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final ProductsController offersController = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          verticalSpaceLarge,

          /// Search Form Faild
          SearchWithFilter(searchController: searchController),

          ListView.builder(
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemCount: offersController.productsModel.products.length,
              itemBuilder: (ctx, index) => MyText.h6(
                  offersController.productsModel.products[index].description
                  // child: ProductWidget(
                  //     productsModel:
                  //         offersController.productsModel.products[index]),
                  )),
        ],
      ),
    );
  }
}
