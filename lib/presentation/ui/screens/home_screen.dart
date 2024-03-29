
import 'package:craft_bay/presentation/state_holders/auth_controller.dart';
import 'package:craft_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craft_bay/presentation/ui/screens/auth/verity_email_screen.dart';
import 'package:craft_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:craft_bay/presentation/ui/screens/review/create_review_screen.dart';
import 'package:craft_bay/presentation/ui/screens/review/review_screen.dart';
import 'package:craft_bay/presentation/ui/utility/assets_path.dart';
import 'package:craft_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:craft_bay/presentation/ui/widgets/home/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/category_item.dart';
import '../widgets/home/circle_icon_botton.dart';
import '../widgets/product_card_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 8,),
              search_text_feild,
              SizedBox(height: 16,),
              BannerCarousel(),
              SizedBox(height: 16,),
              SectionTitle(title: "All Category", onTapSeeall: (){
                Get.find<MainBottomNabController>().ChangeIndex(1);
              }),
              category_list,
              SectionTitle(title: "Popular", onTapSeeall: (){
                Get.to(ProductListScreen());
              }),
              popular_list,
              SizedBox(height: 8,),
              SectionTitle(title: "Special", onTapSeeall: (){
              }),
              popular_list,
              SizedBox(height: 8,),
              SectionTitle(title: "New", onTapSeeall: (){
              }),
              popular_list,

            ],
          ),
        ),
      ),
    );
  }

  SizedBox get category_list {
    return SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: ( context, index) {
                    return CategoryItem();
                  },
                separatorBuilder: ( _, __ ) {
                    return SizedBox(width: 8,);
                },
              ),
            );
  }

  SizedBox get popular_list {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: ( context, index) {
          return ProductcCardItem();
        },
        separatorBuilder: ( _, __ ) {
          return SizedBox(width: 8,);
        },
      ),
    );
  }

  TextFormField get search_text_feild {
    return TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

            );
  }

  AppBar get appbar{
    return AppBar(
      title: Image.asset(AssetsPath.logonav),
      actions: [
        circle_icon_botton(onTap: () async{
          await Get.find<AuthController>().clearAuthData();
          Get.offAll(()=>VerifyEmailScreen);
        }, iconData: Icons.person),
        SizedBox(width: 8,),
        circle_icon_botton(onTap: (){
          Get.to(ReviewScreen());
        }, iconData: Icons.call),
        SizedBox(width: 8,),
        circle_icon_botton(onTap: (){}, iconData: Icons.notifications_active_outlined),
        SizedBox(width: 8,),
      ],
    );
  }

}


