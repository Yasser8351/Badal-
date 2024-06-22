import 'package:badal/models/image_sliders_model.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/my_image_app.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:badal/controller/slider_image_controller/slider_image_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/widgets/shared_widgets/handling_data_view.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({
    Key? key,
    // required this.activeIndex,
    this.onTap,
    required this.listSliders,
    this.autoPlay = true,
    this.padingTop = 0,
  }) : super(key: key);

  final Function(int index)? onTap;
  // int activeIndex;
  final double padingTop;
  final bool autoPlay;
  final List<Sliders> listSliders;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderImageController>(
      builder: (controller) => HandlingDataView(
        loadingState: LoadingState.loaded,
        heightRetryWidget: px100 * 2.5,
        shimmerType: ShimmerType.shimmerRectangular,
        // sizedBoxHeight: 14,
        errorMessage: controller.errorMessage,
        tryAgan: () => controller.getSilderImage(),
        widget: Container(
          height: px90 * 2,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular((10))),
          child: Padding(
            padding: EdgeInsets.only(top: px10, left: px12, right: px12),
            child: InkWell(
              child: CarouselSlider(
                items: listSliders
                    .map(
                      (e) => InkWell(
                        // onTap: () => Get.to(
                        //   () => FullImage(
                        //       imageUrl: ApiUrl.imageUrlTest + e.imageURL),
                        // ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: MyImageApp(
                            image: e.imageURL,
                            width: double.infinity,
                            height: Get.width * 3,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    // controller.onPageChanged(index);
                    // setState(() {
                    //   activeIndex = index;
                    // });
                  },
                  height: Get.height * .29,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.01,
                  autoPlay: autoPlay,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  scrollDirection: Axis.horizontal,
                  disableCenter: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
