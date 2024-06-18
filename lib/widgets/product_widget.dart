import 'package:badal/screen/add_product/product_details_screen.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/card_border.dart';
import 'package:badal/widgets/shared_widgets/container_with_decoration.dart';
import 'package:badal/widgets/shared_widgets/my_image_app.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_time_ago/get_time_ago.dart';
// import 'package:timeago/timeago.dart' as timeago;

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    // required this.productsModel,
  }) : super(key: key);
  // final Products productsModel;

  @override
  Widget build(BuildContext context) {
    // MoneyFormatterOutput priceFormatter = MoneyFormatter(
    //     amount: double.parse(
    //   productsModel.price.toString(),
    // )).output;

    final dateTime = DateTime.now();

    return Align(
      alignment: Alignment.centerRight,
      child: CardBorder(
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
                    MyText.h6("فستان تركي للبيع",
                        //productsModel.name,
                        color: kcBlackDark,
                        fontSize: px18,
                        // fontWeight: FontWeight.bold,
                        maxLines: 3,
                        padding: EdgeInsetsDirectional.only(start: px5)),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        Icon(CupertinoIcons.time,
                            color: Colors.grey, size: px18),
                        MyText.h6(
                          GetTimeAgo.parse(dateTime, locale: 'ar'),
                          padding: EdgeInsetsDirectional.only(
                              start: Get.height * .0038),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Colors.grey, size: px20),
                        const MyText.h6("مكة"),
                      ],
                    ),
                    verticalSpaceRegular,
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: px5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContainerWithDecoration(
                            bottomLeft: 150,
                            bottomRight: 150,
                            topLeft: 150,
                            topRight: 150,
                            color: kcBlackDark,
                            child: MyText.h6(
                              "استبدال",
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 7),
                              fontSize: px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          horizontalSpaceRegular,
                          ContainerWithDecoration(
                            bottomLeft: 150,
                            bottomRight: 150,
                            topLeft: 150,
                            topRight: 150,
                            color: kcBlackDark,
                            child: MyText.h6(
                              "جديد",
                              // "1000 ${AppConfig.curancy.tr}",
                              // "${priceFormatter.nonSymbol} ${AppConfig.curancy.tr}",
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 7),
                              fontSize: px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceRegular,
                    ContainerWithDecoration(
                      onTap: () => Get.to(() => const ProductDetailsScreen()),
                      bottomLeft: 10,
                      bottomRight: 10,
                      topLeft: 10,
                      topRight: 10,
                      color: Colors.white,
                      border: Border.all(color: kcBlackDark),
                      child: MyText.h6(
                        "عرض التفاصيل",
                        color: Colors.black87,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        fontSize: px16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Hero(
                  tag: "imageProduct",
                  child: MyImageApp(
                    image:
                        // "https://cdn.arabsstock.com/uploads/images/98344/image-98344-gulf-gowns-abayas-jalabiyas-models-distinctive-colors-gulf-preview.jpg",
                        "https://cdn.arabsstock.com/uploads/images/98331/image-98331-brown-gulf-abaya-luxurious-modern-designs-fashion-elegance-preview.jpg",

                    // image: ApiUrl.imageUrl + productsModel.productImage,
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
