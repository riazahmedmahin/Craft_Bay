
import 'package:craft_bay/presentation/ui/utility/assets_path.dart';
import 'package:craft_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:craft_bay/presentation/ui/widgets/home/section_title.dart';
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
import '../widgets/category_item.dart';
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
              category_list,
              SectionTitle(title: "Popular", onTapSeeall: (){
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
          return SizedBox(
            height: 190,
            width: 160,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)
                    ),
                    child: Image.asset(AssetsPath.dammyshoe,
                      width:160,
                      height: 120,
                      fit:BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("nike show 120h new collection",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                            overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          children: [
                            Text("\$120",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                            const SizedBox(
                              width: 8,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.star,size: 14,color: Colors.amber,),
                                Text("4.4",style:
                                  TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Card(
                              color: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(Icons.favorite_border_outlined,size: 12,color: Colors.white,),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
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
