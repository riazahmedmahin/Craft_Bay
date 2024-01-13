import 'package:craft_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craft_bay/presentation/ui/screens/review/create_review_screen.dart';
import 'package:craft_bay/presentation/ui/utility/app_colors.dart';
import 'package:craft_bay/presentation/ui/widgets/carts/carts_products_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        //Get.find<MainBottomNabController>().BackToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Review"),
          leading: IconButton(onPressed: (){
            //Get.find<MainBottomNabController>().BackToHome();
          }, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return CartProductItem();
                  },
                  separatorBuilder: (_,__){
                    return SizedBox(height: 8,);
                  }, )
            ),
            priceandchecksection
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: (){
            Get.to(CreateReviewScreen());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  SizedBox get priceandchecksection {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Reviews(100)",style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 30,)
                    ],
                  ),

                ],
              )
          ),

        ],
      ),
    );
  }
}
