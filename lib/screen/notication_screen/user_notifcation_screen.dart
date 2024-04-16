import 'dart:developer';

import 'package:badal/widgets/notifcation_widget.dart';
import 'package:badal/widgets/shared_widgets/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/controller/notification_controller/user_notification_controller.dart';
import 'package:badal/utilits/all_enum.dart';
import 'package:badal/utilits/app_config.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../../utilits/app_ui_helpers.dart';
import '../../../utilits/methode_helper.dart';

class UserNotifcationScreen extends StatefulWidget {
  const UserNotifcationScreen({Key? key}) : super(key: key);

  @override
  State<UserNotifcationScreen> createState() => _UserNotifcationScreenState();
}

class _UserNotifcationScreenState extends State<UserNotifcationScreen> {
  UserNotificationController userNotificationController = Get.find();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      userNotificationController.getNotifications();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(userNotificationController.listNotifications.totalPages.toString());
    log(userNotificationController.listNotifications.totalCount.toString());
    return Scaffold(
      appBar: AppBar(title: Text(AppConfig.notifications.tr)),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
            child: Column(
              children: [
                verticalSpaceRegular,
                GetBuilder<UserNotificationController>(
                  builder: (controller) {
                    return HandlingDataView(
                      shimmerType: ShimmerType.shimmerListRectangular,
                      loadingState: controller.loadingState,
                      tryAgan: () => controller.getNotifications(),
                      sizedBoxHeight: Get.height / 4,
                      errorMessage: controller.errorMessage,
                      widget: RefreshIndicator(
                        onRefresh: () => controller.getNotifications(),
                        child: PaginatedList(
                          shrinkWrap: true,
                          loadingIndicator: handlingPaginationLoading(
                              length: controller
                                  .listNotifications.notifications.length,
                              totalCount:
                                  controller.listNotifications.totalCount),
                          physics: const NeverScrollableScrollPhysics(),
                          padding:
                              const EdgeInsets.only(top: 0, left: 0, right: 0),
                          items: controller.listNotifications.notifications,
                          isRecentSearch: false,
                          isLastPage: false,
                          onLoadMore: (index) {
                            controller.getNotificationMore();
                          },
                          builder: (item, int index) => NoticationWidget(
                              userNotificationController:
                                  userNotificationController,
                              notifcationModel: controller
                                  .listNotifications.notifications[index],
                              index: index),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
