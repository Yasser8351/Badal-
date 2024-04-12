import 'package:badal/model/products_model.dart';
import 'package:badal/utilits/api_url.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/shared_widgets/card_border.dart';
import 'package:badal/widget/shared_widgets/image_app.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
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
      child: CardBorder(
        // decoration: const BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: px10, bottom: px10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: px10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.h6(productsModel.name,
                        color: kcPrimary,
                        fontWeight: FontWeight.bold,
                        maxLines: 3,
                        padding: EdgeInsetsDirectional.only(start: px5)),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        Icon(CupertinoIcons.time,
                            color: Colors.grey, size: px18),
                        MyText.h6("قبل 1 دقيقة",
                            padding: EdgeInsetsDirectional.only(
                                start: Get.height * .0038)),
                      ],
                    ),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Colors.grey, size: px20),
                        const MyText.h6("الرياض"),
                      ],
                    ),
                    verticalSpaceRegular,
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: px5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText.h6(
                            "بيع",
                            color: kcPrimary,
                            fontSize: px20,
                            fontWeight: FontWeight.bold,
                          ),
                          horizontalSpaceRegular,
                          MyText.h6(
                            "${productsModel.price} ${AppConfig.curancy.tr}",
                            color: kcPrimary,
                            fontSize: px20,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Hero(
                  tag: "imageProduct",
                  child: ImageApp(
                    image: ApiUrl.imageUrl + productsModel.productImage,
                    height: Get.height * .2,
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.medium,
                    width: Get.width * .45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
