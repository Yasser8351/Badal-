import 'package:badal/controller/auth_controller/auth_controller.dart';
import 'package:badal/screen/auth_screen/sign_up_screen.dart';
import 'package:badal/screen/tab_screen/tab_screen.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widgets/shared_widgets/logo_app.dart';
import 'package:badal/widgets/shared_widgets/my_button.dart';
import 'package:badal/widgets/shared_widgets/my_text.dart';
import 'package:badal/widgets/shared_widgets/text_faild_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badal/utilits/methode_helper.dart';

import '../../utilits/app_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * .03),
              child: Form(
                key: authController.formKeyLogin,
                child: Column(
                  children: [
                    verticalSpaceXXXLarge,
                    const Hero(
                      tag: "logo",
                      child: LogoApp(),
                      // child: Image.asset(
                      //   AppImage.logo,
                      //   height: Get.height * .17,
                      // ),
                    ),
                    verticalSpaceMedium,
                    MyText.h5(AppConfig.login.tr),
                    verticalSpaceMedium,
                    GetBuilder<AuthController>(
                      builder: (controller) => TextFaildInput(
                        label: AppConfig.email.tr,
                        controller: authController.emalController,
                        trailingIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(Icons.email_outlined),
                        ),
                        hint: AppConfig.email.tr,
                      ),
                    ),
                    verticalSpaceMedium,
                    GetBuilder<AuthController>(
                      builder: (controller) => TextFaildInput(
                        label: AppConfig.password.tr,
                        controller: authController.passwordController,
                        password: authController.hidePassword,
                        enableInteractiveSelection: true,
                        trailingIcon: InkWell(
                          onTap: () => authController.changeStatePassword(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Icon(
                              controller
                                  .getIconPassword(authController.hidePassword),
                              color: controller.getColorIconPassword(
                                  authController.hidePassword),
                            ),
                          ),
                        ),
                        hint: AppConfig.password.tr,
                      ),
                    ),
                    verticalSpaceLarge,
                    GetBuilder<AuthController>(
                      builder: (controller) => MyButton(
                        busy: isLoadingButton(controller.loadingStateLogin),
                        text: AppConfig.login.tr,
                        onTap: () => Get.to(() => TabScreen()),
                        //   await controller.userLogin(),
                      ),
                    ),
                    verticalSpaceRegular,
                    InkWell(
                      onTap: () => Get.off(() => const SignUpScreen()),
                      child: Row(
                        children: [
                          MyText.h6(AppConfig.dontHaveAccount.tr,
                              color: Colors.grey),
                          horizontalSpaceLargTiny,
                          MyText.h6(AppConfig.register.tr, color: kcPrimary),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
