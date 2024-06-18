import 'package:badal/controller/products_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/product_widget.dart';
import 'package:badal/widgets/shared_widgets/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsController productsController = Get.find();

    return GetBuilder<ProductsController>(
      builder: (controller) => HandlingDataView(
        tryAgan: () => productsController.getProducts(),
        shimmerType: ShimmerType.shimmerListRectangular,
        loadingState: LoadingState.loaded,
        errorMessage: productsController.errorMessage,
        sizedBoxHeight: px100 * 1.4,
        widget: ListView.builder(
          // padding: EdgeInsets.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          // itemCount: productsController.productsModel.products.length,
          itemBuilder: (ctx, index) => Padding(
            padding: EdgeInsets.only(bottom: px10),
            child: ProductWidget(
                // productsModel:
                //     productsController.productsModel.products[index]
                ),
          ),
        ),
      ),
    );
  }
}
