import 'package:craft_bay/presentation/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Category",style: TextStyle(fontSize: 18),),
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.95,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context,index){
              return FittedBox(
                  child: CategoryItem());
            }),
      ),
    );
  }
}
