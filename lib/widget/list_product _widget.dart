import 'package:badal/controller/products_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/widget/product_widget.dart';
import 'package:badal/widget/shared_widgets/handling_data_view%20copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (homeController) => HandlingDataView(
        tryAgan: () => homeController.getProducts(),
        shimmerType: ShimmerType.shimmerHorizontal,
        loadingState: homeController.loadingStateProduct,
        errorMessage: homeController.errorMessage,
        widget: SizedBox(
          height: 100,
          width: 100,
          child: ListView.builder(
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemCount: homeController.productsModel.products.length,
            itemBuilder: (ctx, index) => InkWell(
              child: ProductWidget(
                  productsModel: homeController.productsModel.products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
