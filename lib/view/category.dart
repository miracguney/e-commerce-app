import 'package:ecommerce_app/companents/product_category.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';




class Category extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.imagesImg7,fit: BoxFit.cover,),
        Expanded(
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height/1.5 ),),
            itemBuilder: (context, index){
              return Padding(
                padding: 15.allP,
                child: ProductCategory(image: watch.categoryImage[index], text: watch.categoryTitle[index],)
              );
            }, ),
        ),
      ],
    );
  }
}
