import 'package:badal/controller/notification_controller/user_notification_controller.dart';
import 'package:badal/models/notifcation_model/notification_model.dart';
import 'package:badal/screen/notication_screen/notication_details_screen.dart';
import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/my_image_app.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_time_ago/get_time_ago.dart';

class NoticationWidget extends StatefulWidget {
  const NoticationWidget({
    Key? key,
    required this.notifcationModel,
    required this.index,
    required this.userNotificationController,
  }) : super(key: key);

  final Notifications notifcationModel;
  final int index;
  final UserNotificationController userNotificationController;

  @override
  State<NoticationWidget> createState() => _NoticationWidgetState();
}

class _NoticationWidgetState extends State<NoticationWidget> {
  int expIndex = -1;

  @override
  Widget build(BuildContext context) {
    // String creationDate = widget.notifcationModel.creationDate;
    // String creationDate = DateTime.parse(widget.notifcationModel.creationDate);
    return InkWell(
      onTap: () async {
        widget.userNotificationController
            .readNotification(notificationId: widget.notifcationModel.id);
        Get.to(
          () => const NoticationDetailsScreen(),
          arguments: widget.notifcationModel,
          transition: Transition.circularReveal,
          duration: const Duration(milliseconds: 700),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          color: widget.notifcationModel.isRead || expIndex == widget.index
              ? null
              : Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: Column(
              children: [
                verticalSpaceRegular,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyImageApp(image: AppImage.n4, width: px50, height: px50),
                    horizontalSpaceRegular,
                    const MyText.h6(
                      "تم اضافة رد جديد",
                      // widget.notifcationModel.text,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    Text(
                      GetTimeAgo.parse(
                          DateTime.parse(widget.notifcationModel.creationDate),
                          pattern: "dd-MM-yyyy hh:mm aa",
                          locale: 'ar'),
                    ),
                    horizontalSpaceTiny,
                  ],
                ),
                SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: SizedBox(
                      width: Get.width,
                      child: const MyText.h6(
                        "السلام عليكم اختي العزيزة سادفع 1000 ريال مقابل الفستان",
                        // widget.notifcationModel.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // String getImageNotifcation() {
  //   if (widget.notifcationModel.data.data!.appType == "1") {
  //     return AppImage.n3;
  //   }
  //   if (widget.notifcationModel.data.data!.appType == "2") {
  //     return AppImage.n1;
  //   }
  //   if (widget.notifcationModel.data.data!.appType == "3") {
  //     return AppImage.n2;
  //   } else {
  //     return AppImage.n4;
  //   }
  // }
}
