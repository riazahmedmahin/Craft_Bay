import 'package:craft_bay/presentation/ui/screens/review/review_screen.dart';
import 'package:craft_bay/presentation/ui/widgets/product_details/product_selector.dart';
import 'package:craft_bay/presentation/ui/widgets/product_details/image_carousel.dart';
import 'package:craft_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  List<Color> colors=[
   Colors.blueAccent,
    Colors.black,
    Colors.yellow,
    Colors.purple,
    Colors.amber,
  ];
  List<String> sizes = [
    'S',
    'L',
    'M',
    'XL',
    'XXL',
    'XXXL',
  ];
  Color _selectedcolor=Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"),),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ImageCarousel(),
                  product_detailsBody
                ],
              ),
            ),
          ),
          priceandAddToCardchecksection
        ],
      )
    );
  }

  Padding get product_detailsBody {
    return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text("Nike sport shoe new 2023 Edition ED23R ED23 - save 30%",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),)),
                          ValueListenableBuilder(
                              valueListenable: noOfItems,
                              builder: (context, value, _) {
                                /// TODO - Design a item counter
                                return ItemCount(
                                  initialValue: value,
                                  minValue: 1,
                                  maxValue: 20,
                                  decimalPlaces: 0,
                                  step: 1,
                                  color: AppColors.primaryColor,
                                  onChanged: (v) {
                                    noOfItems.value = v.toInt();
                                  },
                                );
                              }),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star,size: 22,color: Colors.amber,),
                              Text("4.4",style:
                              TextStyle(
                                  fontSize: 18,
                                  fontWeight:FontWeight.w600,
                                  color: Colors.black45),
                              ),
                            ],
                          ),
                          SizedBox(width: 8,),
                          InkWell(
                            onTap: (){
                              Get.to(()=>ReviewScreen());
                            },
                            child: Text("Review",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Card(
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.favorite_border_outlined,size: 18,color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8,),
                      Text("Color",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      ColorSelector(colors: colors, onChange:(selectedColor) {
                        _selectedcolor = selectedColor;
                      },),
                      SizedBox(height: 16,),
                      Text("Sizes",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 8,),
                      SizeSelector(sizes: sizes, onChange: (s){
            
                      }),
                      SizedBox(height: 16,),
                      const Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
            
                    ],
                  ),
                );
  }

  Column get priceandAddToCardchecksection {
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
                    Text("Total Price",style: TextStyle(
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
                      child: Text("Add To Cart")),
                )
              ],
            )
        ),

      ],
    );
  }
}