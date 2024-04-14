import 'package:badal/utilits/app_ui_helpers.dart';
import 'package:badal/widget/list_category_widget.dart';
import 'package:badal/widget/list_product_widget.dart';
import 'package:badal/widget/search_with_filter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      /*  appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            SearchWithFilter(searchController: searchController),
          ],
        ),
      */
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceLarge,

            /// Search Form Faild
            SearchWithFilter(searchController: searchController),

            // List of Category  filtering List Products by Category
            const ListCategoryWidget(),

            /// List of Products
            const ListProductWidget(),
          ],
        ),
      ),
    );
  }
}
