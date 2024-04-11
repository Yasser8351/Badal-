import 'package:badal/model/products_model.dart';
import 'package:badal/utilits/api_url.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/shared_widgets/image_app.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.productsModel,
  }) : super(key: key);
  final Products productsModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, right: 15, left: 15),
        child: Container(
          decoration: BoxDecoration(
            color: kcPrimary.withAlpha(22),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Hero(
                  tag: productsModel.id,
                  child: ImageApp(
                    image: ApiUrl.imageUrl + productsModel.productImage,
                    height: Get.height * .1,
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.medium,
                    width: Get.width * .37,
                  ),
                ),
              ),
              verticalSpaceMedium,

              // verticalSpaceSmall,
              // verticalSpaceTiny,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * .008),
                child: SizedBox(
                  width: Get.width * .28,
                  child: MyText.h6(
                      "${productsModel.name}\n${productsModel.description}",
                      maxLines: 3,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      color: kcAccent,
                      fontSize: 11),
                ),
              ),
              // const SizedBox(height: 10),
              // verticalSpaceSmall,
              const Spacer(),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: Get.height * .008),
              //   child: Row(
              //     children: [
              //       RichText(
              //         text: TextSpan(
              //           children: [
              //             TextSpan(
              //               text: productsModel.discount == 0
              //                   ? "${productsModel.price} ${AppConfig.curancy.tr}"
              //                   : "${productsModel.discount} ${AppConfig.curancy.tr}",
              //               style: TextStyle(
              //                 color: kcAccent,
              //                 fontSize: productsModel.discount == 0
              //                     ? Get.height * .015425
              //                     : Get.height * .013425,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(width: 10),
              //       RichText(
              //         text: TextSpan(
              //           children: [
              //             productsModel.discount == 0
              //                 ? const TextSpan()
              //                 : TextSpan(
              //                     text: productsModel.discount == 0
              //                         ? "${productsModel.discount} ${AppConfig.curancy.tr}"
              //                         : "${productsModel.price} ${AppConfig.curancy.tr}",
              //                     style: TextStyle(
              //                       color: kcAccent,
              //                       fontSize: productsModel.discount == 0
              //                           ? Get.height * .015425
              //                           : Get.height * .013425,
              //                       decoration: TextDecoration.lineThrough,
              //                     ),
              //                   ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // verticalSpaceSmall,
            ],
          ),
        ),
        //   ],
        // ),
        // ),
      ),
    );
  }
}
