import 'package:badal/screen/add_product/product_details_screen.dart';
import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/card_border.dart';
import 'package:badal/widgets/shared_widgets/container_with_decoration.dart';
import 'package:badal/widgets/shared_widgets/custom_divider.dart';
import 'package:badal/widgets/shared_widgets/my_image_app.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        color: Colors.white,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: px10, bottom: px10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Prodcut Info
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
                          width: Get.width * .4,
                        ),
                      ),
                    ),
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

              /// favorite
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: Get.height * .055, end: px20),
                child: MyImageApp(
                  image: AppImage.likeRed,
                  height: px32,
                  width: px32,
                ),
                // child: Icon(Icons.favorite, color: Colors.red)
              ),

              /// Comments
              Column(
                children: [
                  MyText.h6("العروض", fontSize: px20),
                  const CustomDivider(),
                  Container(
                    // color: Colors.red,
                    width: Get.width * .4,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listComment.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText.h6(listComment[index].userName),
                                horizontalSpaceSmall,
                                MyText.h6(listComment[index].createdTime),
                              ],
                            ),
                            CustomDivider(width: px90, widthBorder: .1),
                            verticalSpaceSmall,
                            MyText.h6(listComment[index].comment),
                            MyImageApp(
                              image: listComment[index].image,
                              height: 70,
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<CommentModel> listComment = [
  CommentModel(
      userName: "John Doe",
      comment: "ارغب في البدل معك",
      createdTime: "منذ 10 دقائق",
      imageProfile: AppImage.yasser,
      image: AppImage.cat3),
  // CommentModel(
  //     userName: "Yasser Omer",
  //     comment: "ارغب في شراء الفستان",
  //     createdTime: "منذ 20 دقيقة",
  //     imageProfile: AppImage.yasser,
  //     image: AppImage.cat4),
  CommentModel(
      userName: "Ali Omer",
      comment: "بدل مع هذة الحقيبة",
      createdTime: "منذ 34 دقيقة",
      imageProfile: AppImage.yasser,
      image: AppImage.cat5),
];

class CommentModel {
  final String userName;
  final String comment;
  final String createdTime;
  final String imageProfile;
  final String image;

  CommentModel({
    required this.userName,
    required this.comment,
    required this.image,
    required this.createdTime,
    required this.imageProfile,
  });
}




/*
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
        color: Colors.white,
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

*/