import 'package:ecommerce_app/companents/product_card.dart';
import 'package:ecommerce_app/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';




class Wishlist extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:[20, 20, 20, 10].paddingLTRB,
          child:
              Text(
                "My Wishlist",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w800,
                    color: Colors.black
                ),)
          ),
        Expanded(
          child: GridView.builder(


              itemCount: watch.myWishlist.length,
              //padding: [20, 10, 20, 10].paddingLTRB,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height/1.1 ),),
              itemBuilder: (context, index){
                return Padding(
                  padding: 15.allP,
                  child: ProductCard(
                    product: watch.myWishlist[index],
                    setMyWishList: () => watch.setMyWishlist(watch.myWishlist[index]),
                    setBasket: () => watch.addedBasket(watch.basketProducts[index]),
                  ),
                );
              }, ),
        ),
      ],
    );
  }
}
