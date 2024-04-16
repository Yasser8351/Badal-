import 'package:badal/controller/faq_controller/faq_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/widgets/faq_widget.dart';
import 'package:badal/widgets/shared_widgets/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<FAQController>(
        builder: (controller) {
          return HandlingDataView(
            shimmerType: ShimmerType.shimmerListRectangular,
            loadingState: controller.loadingFAQ,
            tryAgan: () => controller.getFAQ(),
            sizedBoxHeight: Get.height / 4,
            errorMessage: controller.errorMessage,
            widget: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listFaq.length,
                  itemBuilder: (context, index) {
                    return FAQWidget(
                      faqModel: controller.listFaq[index],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
