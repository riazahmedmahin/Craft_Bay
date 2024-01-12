import 'package:craft_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craft_bay/presentation/ui/utility/app_colors.dart';
import 'package:craft_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNabController>().BackToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carts"),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNabController>().BackToHome();
          }, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Image.asset(AssetsPath.dammyshoe,width: 100,),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nike shoe 12ksm 2021 Edition asfdsfjksdf jdsjf kdkf j asdasd s',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: (){},
                                icon: Icon(Icons.delete))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '\$100',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                  )
                ],
              ),
            ),
            priceandchecksection
          ],
        ),
      ),
    );
  }

  Column get priceandchecksection {
    return Column(
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
                        Text("Price",style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),),
                        Text("1234",style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),)
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(onPressed: (){},
                          child: Text("Check out")),
                    )
                  ],
                )
              ),

            ],
          );
  }
}
