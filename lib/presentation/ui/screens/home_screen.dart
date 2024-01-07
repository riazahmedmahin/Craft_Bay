import 'package:craft_bay/presentation/ui/utility/assets_path.dart';
import 'package:craft_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:craft_bay/presentation/ui/widgets/home/section_title.dart';
import 'package:flutter/material.dart';

import '../widgets/home/circle_icon_botton.dart';

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
              }),


            ],

          ),
        ),
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
        circle_icon_botton(onTap: (){}, iconData: Icons.person),
        SizedBox(width: 8,),
        circle_icon_botton(onTap: (){}, iconData: Icons.call),
        SizedBox(width: 8,),
        circle_icon_botton(onTap: (){}, iconData: Icons.notifications_active_outlined),
        SizedBox(width: 8,),
      ],
    );
  }

}
