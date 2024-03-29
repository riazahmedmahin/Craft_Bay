import 'package:craft_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';


class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductListScreen(Category: "Electronics",));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.computer,size:32,color: AppColors.primaryColor,),
            ),
          ),
          Text("Computer",style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
