import 'package:craft_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.find<MainBottomNabController>().BackToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Wishlist",style: TextStyle(fontSize: 18),),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNabController>().BackToHome();
          },
              icon: Icon(Icons.arrow_back_ios)),
          elevation: 3,
        ),
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
      ),
    );
  }
}
