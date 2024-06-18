import 'package:badal/widgets/list_product_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("السجل"), automaticallyImplyLeading: false),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            /// List of Products
            const ListProductWidget(),
          ],
        ),
      ),
    );
  }
}
