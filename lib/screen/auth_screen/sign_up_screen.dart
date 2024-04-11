import 'package:badal/controller/auth_controller/auth_controller.dart';
import 'package:badal/screen/auth_screen/login_screen.dart';
import 'package:badal/utilits/app_theme.dart';
import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/shared_widgets/logo_app.dart';
import 'package:badal/widget/shared_widgets/my_button.dart';
import 'package:badal/widget/shared_widgets/my_text.dart';
import 'package:badal/widget/shared_widgets/text_faild_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilits/app_config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                    MyText.h5(AppConfig.register.tr),
                    verticalSpaceMedium,
                    GetBuilder<AuthController>(
                      builder: (controller) => TextFaildInput(
                        label: AppConfig.fullName.tr,
                        controller: authController.nameController,
                        trailingIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.person_3_outlined,
                          ),
                        ),
                        hint: AppConfig.fullName.tr,
                      ),
                    ),
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
                        text: AppConfig.register.tr,
                        // onTap: () =>
                        //   await controller.userSignup(),
                      ),
                    ),
                    verticalSpaceRegular,
                    InkWell(
                      onTap: () => Get.off(() => const LoginScreen()),
                      child: Row(
                        children: [
                          MyText.h6(AppConfig.alreadyHaveAccount.tr,
                              color: Colors.grey),
                          horizontalSpaceLargTiny,
                          MyText.h6(AppConfig.login.tr, color: kcPrimary),
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
