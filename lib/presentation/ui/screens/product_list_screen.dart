import 'package:flutter/material.dart';

import '../widgets/product_card_item.dart';
class ProductListScreen extends StatefulWidget {
   const ProductListScreen({super.key,  this.Category});

  final String? Category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.Category??"Product List"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.95,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context,index){
              return FittedBox(
                  child: ProductcCardItem());
            }),
      ),
    );
  }
}
