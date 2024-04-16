import 'package:badal/models/notifcation_model/notification_model.dart';
import 'package:badal/utilits/app_image.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilits/app_ui_helpers.dart';

class NoticationDetailsScreen extends StatelessWidget {
  const NoticationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Notifications arguments = Get.arguments as Notifications;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: kcAccent.withAlpha(20),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImage.logo,
                    height: Get.height * .2,
                    width: double.infinity,
                    fit: BoxFit.cover),
                verticalSpaceMedium,
                MyText.h5(
                  arguments.text,
                ),
                verticalSpaceSmall,
                verticalSpaceSmall,
                verticalSpaceTiny,
                MyText.h6(arguments.description, maxLines: 1000),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
