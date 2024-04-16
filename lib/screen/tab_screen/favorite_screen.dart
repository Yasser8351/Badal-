import 'package:badal/utilits/app_config.dart';
import 'package:badal/widgets/list_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppConfig.favorite.tr), automaticallyImplyLeading: false),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            /// List of Products
            ListProductWidget(),
          ],
        ),
      ),
    );
  }
}
